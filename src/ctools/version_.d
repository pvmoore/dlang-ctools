module ctools.version_;

enum VERSION = "0.1.1";

/**
Todo:
===================================================================================================

- Implement __VA_ARGS__
- Optimise TokenNavigator.{removeNext,removePrev} functions. These inefficiently manipulate the
  underlying token array.
- Optimise include files with a guard. These can be ignored without passing the tokens each time
- Update __LINE__ definition
- Update __DATE__ definition
- Update __TIME__ definition


Version History:
====================================================================================================

0.1.1 - Move current test files to 'test/pp' subdirectory to make room for non-preprocessor tests
      - Start adding files for Parsing
0.1.0 - Initial commit

*/