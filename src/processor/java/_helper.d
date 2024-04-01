module processor.java._helper;

import processor.base;

string generateFunctionDescriptor(FuncDecl fd) {
    string returnType = getJavaLayout(fd.returnType(), true);
    string funcDesc;
    if(returnType) {
        funcDesc = "FunctionDescriptor.of(" ~ returnType;
    } else {
        funcDesc = "FunctionDescriptor.ofVoid(";
    }

    foreach(i, t; fd.parameterTypes()) {
        if(i>0 || returnType !is null) {
            funcDesc ~= ", ";
        }
        funcDesc ~= getJavaLayout(t, true);
    }
    funcDesc ~= ")";
    return funcDesc;
}

string getJavaLayout(Type t, bool arrayAsStruct = false) {
    if(t.isPtr()) {
        return "ADDRESS";
    } else if(t.kind == TKind.VOID) {
        return null;
    } else if(t.isA!Enum) {
        return("JAVA_INT");
    } else if(t.isA!PrimitiveType) {
        switch(t.kind) with(TKind) {
            case CHAR:
                return "JAVA_BYTE";
            case SHORT:
                return "JAVA_SHORT";
            case INT:
            case LONG:
                return "JAVA_INT";
            case LONG_LONG:
                return "JAVA_LONG";
            case FLOAT:
                return "JAVA_FLOAT";
            case DOUBLE:
                return "JAVA_DOUBLE";
            default:
                throwIf(true, "unsupported kind %s", t.kind);
                break;
        }
    } else if(auto tr = t.as!TypeRef) {
        return getJavaLayout(tr.type);
    } else if(auto ar = t.as!ArrayType) {
        import std;
        int s = ar.dimensions()
                    .map!(it=>it.as!Number)
                    .map!(it=>it.stringValue.toLower().replace("u", "").to!int)
                    .reduce!((a,b)=>a*b);

        if(arrayAsStruct) {
            assert(s < 8);
            string l;
            string ly = getJavaLayout(ar.type());
            foreach(i; 0..s) {
                if(i>0) l ~= ",";
                l ~= ly;
            }
            return "MemoryLayout.structLayout(%s)".format(l);
        }

        return "MemoryLayout.sequenceLayout(%s, ".format(s) ~ getJavaLayout(ar.type()) ~ ")";

    } else if(auto sd = t.as!StructDef) {
        return sd.name ~ ".LAYOUT";
    } else if(auto u = t.as!Union) {
        return u.name ~ ".LAYOUT";
    }
    throwIf(true, "t=%s", t);
    return "?";
}

string createLayout(StructDef sdef, Union un, JavaEmitter emitter) {
    StringBuffer buf = new StringBuffer();
    bool isUnion = un !is null;
    auto vars = isUnion ? un.vars() : sdef.variables();

    if(isUnion) {
        buf.add("\tpublic static final MemoryLayout LAYOUT = MemoryLayout.unionLayout(");
    } else {
        buf.add("\tpublic static final MemoryLayout LAYOUT = MemoryLayout.structLayout(");
    }
    if(vars.length > 0) {
        buf.add("\n");
    }
    int offset = 0;
    int finalPad;
    int totalSize;

    if(isUnion) {
        totalSize = un.size();
        auto largestMemberSize = un.largestMember().type().size();
        finalPad = totalSize - largestMemberSize;
    } else {
        totalSize = sdef.size();
        if(totalSize > 0) {
            auto lastMember = sdef.variables()[sdef.numMembers()-1];
            auto lastMemberOffset = sdef.offsetOfMember(sdef.numMembers()-1);
            auto lastMemberSize = lastMember.type().size();
            finalPad = totalSize - (lastMemberOffset + lastMemberSize);
        }
    }

    foreach(i, v; vars) {
        auto n = v.name;
        auto t = v.type();
        auto a = t.alignment();
        auto size = t.size();

        buf.add("");

        if(!isUnion) {
            auto rem = offset & (a>>>1);
            if(rem != 0) {
                offset += rem;
                string pad = "PAD%s".format(rem);
                buf.add("% 36s,\n", pad);
            }
        }

        buf.add("% 36s", getJavaLayout(t));

        if(finalPad > 0 || i < vars.length-1) {
            buf.add(",");
        } else {
            buf.add(" ");
        }

        buf.add(" // [%0.2s] ", offset);
        emitter.emit(t, buf);
        buf.add(" %s", n);

        if(!isUnion) {
            offset += size;
        }

        buf.add("\t\n");
    }

    if(finalPad > 0) {
        buf.add("% 36s\n", "PAD%s".format(finalPad));
    }

    buf.add("\t\t// (%s bytes total)\n", totalSize);

    buf.add("\t);\n\n");

    return buf.toString();
}

string getJavaType(Type t, bool useRealStructName) {
    if(t.isA!PtrType) {
        return "MemorySegment";
    }
    if(t.isA!Enum) {
        return "int";
    }
    if(auto sd = t.as!StructDef) {
        return useRealStructName ? sd.name : "struct";
    }
    if(auto tr = t.as!TypeRef) {
        return getJavaType(tr.type, useRealStructName);
    }
    if(auto u = t.as!Union) {
        throwIf(!u.name, "union has no name");
        return useRealStructName ? u.name : "struct";
    }
    if(auto arr = t.as!ArrayType) {
        return getJavaType(arr.type(), useRealStructName) ~ "[]";
    }
    if(auto pt = t.as!PrimitiveType) {
        switch(t.kind) with(TKind) {
            case CHAR:
                return "byte";
            case SHORT:
                return "short";
            case INT:
            case LONG:
                return "int";
            case LONG_LONG:
                return "long";
            case FLOAT:
                return "float";
            case DOUBLE:
                return "double";
            default:
                break;
        }
    }
    throwIf(true, "Unsupported type %s", t);
    return "?";
}

bool isPossibleString(string name) {
    import std;

    auto lower = name.toLower();

    if(lower.containsAny("descriptor")) return false;
    return lower.containsAny("desc", "name");
}

string createGetter(string structName, int offset, Var v) {
    string s;
    auto returnJavaType = getJavaType(v.type(), true);
    auto javaType = capitalised(getJavaType(v.type(), false));
    auto array = v.type().as!ArrayType;
    bool isArray = array !is null;
    bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
        (isBuiltin(array.type()) || isEnum(array.type()));

    if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
        returnJavaType = "String";
        javaType = "BytesAsString";
        isArray = false;
    }

    if(isArray) {
        javaType = "ArrayOf" ~ javaType[0..$-2];

        if(!isPrimitiveArray && "MemorySegment[]"!=returnJavaType) {
            returnJavaType = returnJavaType[0..$-2];
        }
    }

    s ~= "\tpublic %s %s() {\n".format(returnJavaType, v.name);
    s ~= "\t\treturn NativeMemory.get%s(mem, %s".format(javaType, offset);


    if("ArrayOfStruct"==javaType) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        s ~= ", %s, %s.class)".format(arraySize / elementSize, returnJavaType);
    } else if("Struct"==javaType) {
        s ~= ", %s.class)".format(returnJavaType);
    } else if(isArray) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        s ~= ", %s)".format(arraySize / elementSize);
    } else {
        s ~= ")";
    }

    s ~= ";\n\t}\n";

    return s;
}

string createSetter(string structName, int offset, Var v) {
    string s;
    auto javaType = getJavaType(v.type(), true);
    auto array = v.type().as!ArrayType;
    bool isArray = array !is null;
    bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
        (isBuiltin(array.type()) || isEnum(array.type()));

    // if("VkInstanceCreateInfo"==structName && offset==28) {
    //     writefln("array == %s, isPrimitiveType = %s", array, isPrimitiveArray);
    //     throwIf(true);
    // }

    if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
        s ~= "\tpublic %s %s(String s) {\n".format(structName, v.name);
        s ~= "\t\tNativeMemory.set(mem, %s, s.getBytes(), %s);\n".format(offset, v.type().size());
        s ~= "\t\treturn this;\n";
        s ~= "\t}\n";
    }
    if("MemorySegment"==javaType && isPossibleString(v.name)) {
        // If we get here then v.type() must be a PtrType
        auto ptr = getPtrType(v.type());
        throwIf(!ptr, "type = %s", v.type());

        if(ptr.ptrDepth == 1) {
            s ~= "\tpublic %s %s(String s) {\n".format(structName, v.name);
            s ~= "\t\tNativeMemory.set(mem, %s, s);\n".format(offset);
            s ~= "\t\treturn this;\n";
            s ~= "\t}\n";
        } else if(ptr.ptrDepth == 2) {
            s ~= "\tpublic %s %s(String[] s) {\n".format(structName, v.name);
            s ~= "\t\tNativeMemory.set(mem, %s, s);\n".format(offset);
            s ~= "\t\treturn this;\n";
            s ~= "\t}\n";
        }
    }
    if(isArray && !isPrimitiveArray && "MemorySegment"!=javaType) {
        // Remove the [] at the end so that it is a single Struct type
        javaType = javaType[0..$-2];
    }

    if(isArray && !isPrimitiveArray && "MemorySegment"==javaType) {
        javaType ~= "[]";
    }

    s ~= "\tpublic %s %s(%s v) {\n".format(structName, v.name, javaType);

    if(isPrimitiveArray) {
        auto arraySize = array.size();
        auto elementSize = array.type().size();
        auto numElements = arraySize / elementSize;
        s ~= "\t\tNativeMemory.set(mem, %s, v, %s);\n".format(offset, numElements);
    } else {
        s ~= "\t\tNativeMemory.set(mem, %s, v);\n".format(offset);
    }
    s ~= "\t\treturn this;\n";
    s ~= "\t}\n";

    return s;
}

string createToString(Union un) {
    string s = "\t@Override public String toString() {\n";
    s ~= "\t\treturn \"%s{...}\";\n".format(un.name);
    s ~= "\t}\n";
    return s;
}

string createToString(StructDef sd) {

    const pattern = regex(r"pp(.*)Names");

    int _getCountVarOffset(string capture) {
        import std;
        auto findme = capture.toLower() ~ "count";
        foreach(i, v; sd.variables()) {
            if(v.name.toLower()==findme) {
                return sd.offsetOfMember(i.as!int);
            }
        }
        return -1;
    }

    string _toString() {
        string names;
        string values;

        foreach(i, v; sd.variables()) {
            auto javaType = capitalised(getJavaType(v.type(), false));
            auto array = v.type().as!ArrayType;
            bool isArray = array !is null;
            bool isPrimitiveArray = isArray && !array.type().isA!PtrType &&
                (isBuiltin(array.type()) || isEnum(array.type()));
            bool quoted = false;

            if(isArray) {
                javaType = "ArrayOf" ~ javaType[0..$-2];
            }

            if(isPrimitiveArray && array.type().kind == TKind.CHAR && isPossibleString(v.name)) {
                javaType = "BytesAsString";
                isArray = false;
                quoted = true;
            }
            if("MemorySegment" == javaType && isPossibleString(v.name)) {
                javaType = "MemorySegmentAsString";
                quoted = true;
            }

            // Convert these to getString:
            // - XCount
			// - ppXNames
            auto countOffset = 0;
            if(auto capture = v.name.matchFirst(pattern)) {
                if(auto countVar = _getCountVarOffset(capture[1])) {
                    javaType = "ArrayOfString";
                    countOffset = countVar;
                }
            }

            int offset = sd.offsetOfMember(i.as!int);

            bool stringOf = "MemorySegment" == javaType ||
                          "ArrayOfString" == javaType;

            names ~= "\t\t\t\t\t\"%s=".format(v.name) ~ (quoted ? "'%s'" : "%s");

            if(stringOf) {
                values ~= "\t\t\t\tstringOf(get%s(startMem, offset + %s".format(javaType, offset);
            } else {
                values ~= "\t\t\t\tNativeMemory.get%s(startMem, offset + %s".format(javaType, offset);
            }

            if("ArrayOfStruct"==javaType) {
                auto arraySize = array.size();
                auto elementSize = array.type().size();
                auto realJavaType = getJavaType(v.type(), true)[0..$-2];
                values ~= ", %s, %s.class)".format(arraySize / elementSize, realJavaType);

            } else if("Struct"==javaType) {
                auto realJavaType = getJavaType(v.type(), true);
                values ~= ", %s.class)".format(realJavaType);

            } else if("ArrayOfString"==javaType) {
                values ~= ", NativeMemory.getInt(startMem, offset + %s))".format(countOffset);

            } else if(isArray) {
                auto arraySize = array.size();
                auto elementSize = array.type().size();
                values ~= ", %s)".format(arraySize / elementSize);

            } else {
                values ~= ")";
            }
            if(stringOf) {
                values ~= ")";
            }

            offset += v.type().size();
            if(i < sd.numMembers()-1) {
                names ~= ", \" +\n";
                values ~= ",\n";
            } else {
                names ~= "}\",\n";
                values ~= ")";
            }
        }
        return names ~ values;
    }

    string _getString() {
        string s;
        if(sd.numMembers()==0) {
            s ~= "\"%s{}\"".format(sd.name);
        } else {
            s ~= "String.format(\"%s{\" +\n%s".format(sd.name, _toString());
        }
        return s;
    }

    string s = "\t@Override public String toString() {\n";

    s ~= "\t\tvar s = new StringBuilder();\n";
    s ~= "\t\tvar offset = 0;\n";
    s ~= "\t\tif(count > 1) s.append(\"[\\n\\t\");\n";
    s ~= "\t\tfor(int i=0; i<count; i++) {\n";
    s ~= "\t\t\tif(i>0) s.append(\",\\n\\t\");\n";
    s ~= "\t\t\ts.append(";
    s ~= _getString();
    s ~= ");\n";
    s ~= "\t\t\toffset += (int)LAYOUT.byteSize();\n";
    s ~= "\t\t}\n";
    s ~= "\t\tif(count > 1) s.append(\"\\n]\");\n";

    s ~= "\t\treturn s.toString();\n";
    return s ~ "\t}\n";
}
