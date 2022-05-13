module ctools.logs;

private {
    __gshared static immutable enum ENABLED_LOGS = [
        // "ExprParser" : true,
        // "StmtParser" : true,
        // "TypeParser" : true,
        // "VarParser"  : true,
		"Extractor" : true,
        "..." : true
    ];
}

/**
 * Write log if class name is in the ENABLED_LOGS map
 *
 * this.log("fmt", args);
 */
void log(T, A...)(T src, string fmt, A args) if(is(T==class) || is(T==interface)) {
	import std;

	// Remove template types
	static if(T.stringof.indexOf('!')!=-1) {
		string name = T.stringof[0..T.stringof.indexOf('!')];
	} else {
		string name = T.stringof;
	}

    if(name in ENABLED_LOGS) {
	    writefln("[%s] ".format(name) ~ format(fmt, args));
    }

	// enum MAXLEN = 15;
	// static if(T.stringof.length > MAXLEN) {
	// 	string name = T.stringof[0..MAXLEN-2] ~ "..";
	// 	doLog("[%s] ".format(name) ~ format(fmt, args), Level.INFO);

	// } else {
	// 	doLog("[%-*s] ".format(MAXLEN, T.stringof) ~ format(fmt, args), Level.INFO);
	// }
}