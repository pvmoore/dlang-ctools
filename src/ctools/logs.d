module ctools.logs;

private {
    __gshared static immutable ENABLED_LOGS = [
        // "ExprParser" : true,
        // "StmtParser" : true,
        // "TypeParser" : true,
        // "VarParser"  : true,
		// "Extractor"  : true,
		// "Emitter"    : true,
		"..." : false
    ];
	enum ENABLE_FILE_LOG = ENABLED_LOGS.length > 1;
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
		logger.log("[%s] ".format(name) ~ format(fmt, args));

		import common.io : flushConsole;
		import logging : flushLog;
		flushLog();
		flushConsole();
    }

	// enum MAXLEN = 15;
	// static if(T.stringof.length > MAXLEN) {
	// 	string name = T.stringof[0..MAXLEN-2] ~ "..";
	// 	doLog("[%s] ".format(name) ~ format(fmt, args), Level.INFO);

	// } else {
	// 	doLog("[%-*s] ".format(MAXLEN, T.stringof) ~ format(fmt, args), Level.INFO);
	// }
}

import logging;


__gshared {
FileLogger logger;
}

__gshared static this() {
	if(ENABLE_FILE_LOG) {
    	logger = new FileLogger("debug.log");
	}
}

__gshared static ~this() {
	if(logger) logger.close();
}

