module ctools.version_;

enum VERSION = "0.1.2";

/**
Todo:
===================================================================================================

- Implement __VA_ARGS__
- Optimise include files with a guard. These can be ignored without passing the tokens each time
- Update __LINE__ definition
- Update __DATE__ definition
- Update __TIME__ definition


Version History:
====================================================================================================

0.1.2 - More parsing.
        Optimise TokenNavigator (now 20x speedup)
0.1.1 - Move current test files to 'test/pp' subdirectory to make room for non-preprocessor tests
      - Start adding files for Parsing
      - Fix some preprocessing bugs
0.1.0 - Initial commit

*/