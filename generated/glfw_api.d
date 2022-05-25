module glfw_api;

public:

import vulkan_api;

// Definitions
enum GLFW_ACCUM_ALPHA_BITS = 0x0002100A;
enum GLFW_ACCUM_BLUE_BITS = 0x00021009;
enum GLFW_ACCUM_GREEN_BITS = 0x00021008;
enum GLFW_ACCUM_RED_BITS = 0x00021007;
enum GLFW_ALPHA_BITS = 0x00021004;
enum GLFW_ANY_RELEASE_BEHAVIOR = 0;
enum GLFW_API_UNAVAILABLE = 0x00010006;
enum GLFW_ARROW_CURSOR = 0x00036001;
enum GLFW_AUTO_ICONIFY = 0x00020006;
enum GLFW_AUX_BUFFERS = 0x0002100B;
enum GLFW_BLUE_BITS = 0x00021003;
enum GLFW_CENTER_CURSOR = 0x00020009;
enum GLFW_CLIENT_API = 0x00022001;
enum GLFW_COCOA_CHDIR_RESOURCES = 0x00051001;
enum GLFW_COCOA_FRAME_NAME = 0x00023002;
enum GLFW_COCOA_GRAPHICS_SWITCHING = 0x00023003;
enum GLFW_COCOA_MENUBAR = 0x00051002;
enum GLFW_COCOA_RETINA_FRAMEBUFFER = 0x00023001;
enum GLFW_CONNECTED = 0x00040001;
enum GLFW_CONTEXT_CREATION_API = 0x0002200B;
enum GLFW_CONTEXT_NO_ERROR = 0x0002200A;
enum GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009;
enum GLFW_CONTEXT_REVISION = 0x00022004;
enum GLFW_CONTEXT_ROBUSTNESS = 0x00022005;
enum GLFW_CONTEXT_VERSION_MAJOR = 0x00022002;
enum GLFW_CONTEXT_VERSION_MINOR = 0x00022003;
enum GLFW_CROSSHAIR_CURSOR = 0x00036003;
enum GLFW_CURSOR = 0x00033001;
enum GLFW_CURSOR_DISABLED = 0x00034003;
enum GLFW_CURSOR_HIDDEN = 0x00034002;
enum GLFW_CURSOR_NORMAL = 0x00034001;
enum GLFW_DECORATED = 0x00020005;
enum GLFW_DEPTH_BITS = 0x00021005;
enum GLFW_DISCONNECTED = 0x00040002;
enum GLFW_DONT_CARE = - 1;
enum GLFW_DOUBLEBUFFER = 0x00021010;
enum GLFW_EGL_CONTEXT_API = 0x00036002;
enum GLFW_FALSE = 0;
enum GLFW_FLOATING = 0x00020007;
enum GLFW_FOCUSED = 0x00020001;
enum GLFW_FOCUS_ON_SHOW = 0x0002000C;
enum GLFW_FORMAT_UNAVAILABLE = 0x00010009;
enum GLFW_GAMEPAD_AXIS_LAST = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER;
enum GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = 4;
enum GLFW_GAMEPAD_AXIS_LEFT_X = 0;
enum GLFW_GAMEPAD_AXIS_LEFT_Y = 1;
enum GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5;
enum GLFW_GAMEPAD_AXIS_RIGHT_X = 2;
enum GLFW_GAMEPAD_AXIS_RIGHT_Y = 3;
enum GLFW_GAMEPAD_BUTTON_A = 0;
enum GLFW_GAMEPAD_BUTTON_B = 1;
enum GLFW_GAMEPAD_BUTTON_BACK = 6;
enum GLFW_GAMEPAD_BUTTON_CIRCLE = GLFW_GAMEPAD_BUTTON_B;
enum GLFW_GAMEPAD_BUTTON_CROSS = GLFW_GAMEPAD_BUTTON_A;
enum GLFW_GAMEPAD_BUTTON_DPAD_DOWN = 13;
enum GLFW_GAMEPAD_BUTTON_DPAD_LEFT = 14;
enum GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = 12;
enum GLFW_GAMEPAD_BUTTON_DPAD_UP = 11;
enum GLFW_GAMEPAD_BUTTON_GUIDE = 8;
enum GLFW_GAMEPAD_BUTTON_LAST = GLFW_GAMEPAD_BUTTON_DPAD_LEFT;
enum GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = 4;
enum GLFW_GAMEPAD_BUTTON_LEFT_THUMB = 9;
enum GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5;
enum GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = 10;
enum GLFW_GAMEPAD_BUTTON_SQUARE = GLFW_GAMEPAD_BUTTON_X;
enum GLFW_GAMEPAD_BUTTON_START = 7;
enum GLFW_GAMEPAD_BUTTON_TRIANGLE = GLFW_GAMEPAD_BUTTON_Y;
enum GLFW_GAMEPAD_BUTTON_X = 2;
enum GLFW_GAMEPAD_BUTTON_Y = 3;
enum GLFW_GREEN_BITS = 0x00021002;
enum GLFW_HAND_CURSOR = 0x00036004;
enum GLFW_HAT_CENTERED = 0;
enum GLFW_HAT_DOWN = 4;
enum GLFW_HAT_LEFT = 8;
enum GLFW_HAT_LEFT_DOWN = ( GLFW_HAT_LEFT | GLFW_HAT_DOWN );
enum GLFW_HAT_LEFT_UP = ( GLFW_HAT_LEFT | GLFW_HAT_UP );
enum GLFW_HAT_RIGHT = 2;
enum GLFW_HAT_RIGHT_DOWN = ( GLFW_HAT_RIGHT | GLFW_HAT_DOWN );
enum GLFW_HAT_RIGHT_UP = ( GLFW_HAT_RIGHT | GLFW_HAT_UP );
enum GLFW_HAT_UP = 1;
enum GLFW_HOVERED = 0x0002000B;
enum GLFW_HRESIZE_CURSOR = 0x00036005;
enum GLFW_IBEAM_CURSOR = 0x00036002;
enum GLFW_ICONIFIED = 0x00020002;
enum GLFW_INCLUDE_VULKAN = 1;
enum GLFW_INVALID_ENUM = 0x00010003;
enum GLFW_INVALID_VALUE = 0x00010004;
enum GLFW_JOYSTICK_1 = 0;
enum GLFW_JOYSTICK_10 = 9;
enum GLFW_JOYSTICK_11 = 10;
enum GLFW_JOYSTICK_12 = 11;
enum GLFW_JOYSTICK_13 = 12;
enum GLFW_JOYSTICK_14 = 13;
enum GLFW_JOYSTICK_15 = 14;
enum GLFW_JOYSTICK_16 = 15;
enum GLFW_JOYSTICK_2 = 1;
enum GLFW_JOYSTICK_3 = 2;
enum GLFW_JOYSTICK_4 = 3;
enum GLFW_JOYSTICK_5 = 4;
enum GLFW_JOYSTICK_6 = 5;
enum GLFW_JOYSTICK_7 = 6;
enum GLFW_JOYSTICK_8 = 7;
enum GLFW_JOYSTICK_9 = 8;
enum GLFW_JOYSTICK_HAT_BUTTONS = 0x00050001;
enum GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16;
enum GLFW_KEY_0 = 48;
enum GLFW_KEY_1 = 49;
enum GLFW_KEY_2 = 50;
enum GLFW_KEY_3 = 51;
enum GLFW_KEY_4 = 52;
enum GLFW_KEY_5 = 53;
enum GLFW_KEY_6 = 54;
enum GLFW_KEY_7 = 55;
enum GLFW_KEY_8 = 56;
enum GLFW_KEY_9 = 57;
enum GLFW_KEY_A = 65;
enum GLFW_KEY_APOSTROPHE = 39;
enum GLFW_KEY_B = 66;
enum GLFW_KEY_BACKSLASH = 92;
enum GLFW_KEY_BACKSPACE = 259;
enum GLFW_KEY_C = 67;
enum GLFW_KEY_CAPS_LOCK = 280;
enum GLFW_KEY_COMMA = 44;
enum GLFW_KEY_D = 68;
enum GLFW_KEY_DELETE = 261;
enum GLFW_KEY_DOWN = 264;
enum GLFW_KEY_E = 69;
enum GLFW_KEY_END = 269;
enum GLFW_KEY_ENTER = 257;
enum GLFW_KEY_EQUAL = 61;
enum GLFW_KEY_ESCAPE = 256;
enum GLFW_KEY_F = 70;
enum GLFW_KEY_F1 = 290;
enum GLFW_KEY_F10 = 299;
enum GLFW_KEY_F11 = 300;
enum GLFW_KEY_F12 = 301;
enum GLFW_KEY_F13 = 302;
enum GLFW_KEY_F14 = 303;
enum GLFW_KEY_F15 = 304;
enum GLFW_KEY_F16 = 305;
enum GLFW_KEY_F17 = 306;
enum GLFW_KEY_F18 = 307;
enum GLFW_KEY_F19 = 308;
enum GLFW_KEY_F2 = 291;
enum GLFW_KEY_F20 = 309;
enum GLFW_KEY_F21 = 310;
enum GLFW_KEY_F22 = 311;
enum GLFW_KEY_F23 = 312;
enum GLFW_KEY_F24 = 313;
enum GLFW_KEY_F25 = 314;
enum GLFW_KEY_F3 = 292;
enum GLFW_KEY_F4 = 293;
enum GLFW_KEY_F5 = 294;
enum GLFW_KEY_F6 = 295;
enum GLFW_KEY_F7 = 296;
enum GLFW_KEY_F8 = 297;
enum GLFW_KEY_F9 = 298;
enum GLFW_KEY_G = 71;
enum GLFW_KEY_GRAVE_ACCENT = 96;
enum GLFW_KEY_H = 72;
enum GLFW_KEY_HOME = 268;
enum GLFW_KEY_I = 73;
enum GLFW_KEY_INSERT = 260;
enum GLFW_KEY_J = 74;
enum GLFW_KEY_K = 75;
enum GLFW_KEY_KP_0 = 320;
enum GLFW_KEY_KP_1 = 321;
enum GLFW_KEY_KP_2 = 322;
enum GLFW_KEY_KP_3 = 323;
enum GLFW_KEY_KP_4 = 324;
enum GLFW_KEY_KP_5 = 325;
enum GLFW_KEY_KP_6 = 326;
enum GLFW_KEY_KP_7 = 327;
enum GLFW_KEY_KP_8 = 328;
enum GLFW_KEY_KP_9 = 329;
enum GLFW_KEY_KP_ADD = 334;
enum GLFW_KEY_KP_DECIMAL = 330;
enum GLFW_KEY_KP_DIVIDE = 331;
enum GLFW_KEY_KP_ENTER = 335;
enum GLFW_KEY_KP_EQUAL = 336;
enum GLFW_KEY_KP_MULTIPLY = 332;
enum GLFW_KEY_KP_SUBTRACT = 333;
enum GLFW_KEY_L = 76;
enum GLFW_KEY_LAST = GLFW_KEY_MENU;
enum GLFW_KEY_LEFT = 263;
enum GLFW_KEY_LEFT_ALT = 342;
enum GLFW_KEY_LEFT_BRACKET = 91;
enum GLFW_KEY_LEFT_CONTROL = 341;
enum GLFW_KEY_LEFT_SHIFT = 340;
enum GLFW_KEY_LEFT_SUPER = 343;
enum GLFW_KEY_M = 77;
enum GLFW_KEY_MENU = 348;
enum GLFW_KEY_MINUS = 45;
enum GLFW_KEY_N = 78;
enum GLFW_KEY_NUM_LOCK = 282;
enum GLFW_KEY_O = 79;
enum GLFW_KEY_P = 80;
enum GLFW_KEY_PAGE_DOWN = 267;
enum GLFW_KEY_PAGE_UP = 266;
enum GLFW_KEY_PAUSE = 284;
enum GLFW_KEY_PERIOD = 46;
enum GLFW_KEY_PRINT_SCREEN = 283;
enum GLFW_KEY_Q = 81;
enum GLFW_KEY_R = 82;
enum GLFW_KEY_RIGHT = 262;
enum GLFW_KEY_RIGHT_ALT = 346;
enum GLFW_KEY_RIGHT_BRACKET = 93;
enum GLFW_KEY_RIGHT_CONTROL = 345;
enum GLFW_KEY_RIGHT_SHIFT = 344;
enum GLFW_KEY_RIGHT_SUPER = 347;
enum GLFW_KEY_S = 83;
enum GLFW_KEY_SCROLL_LOCK = 281;
enum GLFW_KEY_SEMICOLON = 59;
enum GLFW_KEY_SLASH = 47;
enum GLFW_KEY_SPACE = 32;
enum GLFW_KEY_T = 84;
enum GLFW_KEY_TAB = 258;
enum GLFW_KEY_U = 85;
enum GLFW_KEY_UNKNOWN = - 1;
enum GLFW_KEY_UP = 265;
enum GLFW_KEY_V = 86;
enum GLFW_KEY_W = 87;
enum GLFW_KEY_WORLD_1 = 161;
enum GLFW_KEY_WORLD_2 = 162;
enum GLFW_KEY_X = 88;
enum GLFW_KEY_Y = 89;
enum GLFW_KEY_Z = 90;
enum GLFW_LOCK_KEY_MODS = 0x00033004;
enum GLFW_LOSE_CONTEXT_ON_RESET = 0x00031002;
enum GLFW_MAXIMIZED = 0x00020008;
enum GLFW_MOD_ALT = 0x0004;
enum GLFW_MOD_CAPS_LOCK = 0x0010;
enum GLFW_MOD_CONTROL = 0x0002;
enum GLFW_MOD_NUM_LOCK = 0x0020;
enum GLFW_MOD_SHIFT = 0x0001;
enum GLFW_MOD_SUPER = 0x0008;
enum GLFW_MOUSE_BUTTON_1 = 0;
enum GLFW_MOUSE_BUTTON_2 = 1;
enum GLFW_MOUSE_BUTTON_3 = 2;
enum GLFW_MOUSE_BUTTON_4 = 3;
enum GLFW_MOUSE_BUTTON_5 = 4;
enum GLFW_MOUSE_BUTTON_6 = 5;
enum GLFW_MOUSE_BUTTON_7 = 6;
enum GLFW_MOUSE_BUTTON_8 = 7;
enum GLFW_MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8;
enum GLFW_MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1;
enum GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;
enum GLFW_MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2;
enum GLFW_NATIVE_CONTEXT_API = 0x00036001;
enum GLFW_NOT_INITIALIZED = 0x00010001;
enum GLFW_NO_API = 0;
enum GLFW_NO_CURRENT_CONTEXT = 0x00010002;
enum GLFW_NO_ERROR = 0;
enum GLFW_NO_RESET_NOTIFICATION = 0x00031001;
enum GLFW_NO_ROBUSTNESS = 0;
enum GLFW_NO_WINDOW_CONTEXT = 0x0001000A;
enum GLFW_OPENGL_ANY_PROFILE = 0;
enum GLFW_OPENGL_API = 0x00030001;
enum GLFW_OPENGL_COMPAT_PROFILE = 0x00032002;
enum GLFW_OPENGL_CORE_PROFILE = 0x00032001;
enum GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007;
enum GLFW_OPENGL_ES_API = 0x00030002;
enum GLFW_OPENGL_FORWARD_COMPAT = 0x00022006;
enum GLFW_OPENGL_PROFILE = 0x00022008;
enum GLFW_OSMESA_CONTEXT_API = 0x00036003;
enum GLFW_OUT_OF_MEMORY = 0x00010005;
enum GLFW_PLATFORM_ERROR = 0x00010008;
enum GLFW_PRESS = 1;
enum GLFW_RAW_MOUSE_MOTION = 0x00033005;
enum GLFW_RED_BITS = 0x00021001;
enum GLFW_REFRESH_RATE = 0x0002100F;
enum GLFW_RELEASE = 0;
enum GLFW_RELEASE_BEHAVIOR_FLUSH = 0x00035001;
enum GLFW_RELEASE_BEHAVIOR_NONE = 0x00035002;
enum GLFW_REPEAT = 2;
enum GLFW_RESIZABLE = 0x00020003;
enum GLFW_SAMPLES = 0x0002100D;
enum GLFW_SCALE_TO_MONITOR = 0x0002200C;
enum GLFW_SRGB_CAPABLE = 0x0002100E;
enum GLFW_STENCIL_BITS = 0x00021006;
enum GLFW_STEREO = 0x0002100C;
enum GLFW_STICKY_KEYS = 0x00033002;
enum GLFW_STICKY_MOUSE_BUTTONS = 0x00033003;
enum GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A;
enum GLFW_TRUE = 1;
enum GLFW_VERSION_MAJOR = 3;
enum GLFW_VERSION_MINOR = 3;
enum GLFW_VERSION_REVISION = 7;
enum GLFW_VERSION_UNAVAILABLE = 0x00010007;
enum GLFW_VISIBLE = 0x00020004;
enum GLFW_VRESIZE_CURSOR = 0x00036006;
enum GLFW_X11_CLASS_NAME = 0x00024001;
enum GLFW_X11_INSTANCE_NAME = 0x00024002;
// End Definitions
alias GLFWcharfun = void function(GLFWwindow* window, uint codepoint);
alias GLFWcharmodsfun = void function(GLFWwindow* window, uint codepoint, int mods);
alias GLFWcursorenterfun = void function(GLFWwindow* window, int entered);
alias GLFWcursorposfun = void function(GLFWwindow* window, double xpos, double ypos);
alias GLFWdropfun = void function(GLFWwindow* window, int path_count, byte*[-1] paths);
alias GLFWerrorfun = void function(int error_code, byte* description);
alias GLFWframebuffersizefun = void function(GLFWwindow* window, int width, int height);
alias GLFWglproc = void function();
alias GLFWjoystickfun = void function(int jid, int event);
alias GLFWkeyfun = void function(GLFWwindow* window, int key, int scancode, int action, int mods);
alias GLFWmonitorfun = void function(GLFWmonitor* monitor, int event);
alias GLFWmousebuttonfun = void function(GLFWwindow* window, int button, int action, int mods);
alias GLFWscrollfun = void function(GLFWwindow* window, double xoffset, double yoffset);
alias GLFWvkproc = void function();
alias GLFWwindowclosefun = void function(GLFWwindow* window);
alias GLFWwindowcontentscalefun = void function(GLFWwindow* window, float xscale, float yscale);
alias GLFWwindowfocusfun = void function(GLFWwindow* window, int focused);
alias GLFWwindowiconifyfun = void function(GLFWwindow* window, int iconified);
alias GLFWwindowmaximizefun = void function(GLFWwindow* window, int maximized);
alias GLFWwindowposfun = void function(GLFWwindow* window, int xpos, int ypos);
alias GLFWwindowrefreshfun = void function(GLFWwindow* window);
alias GLFWwindowsizefun = void function(GLFWwindow* window, int width, int height);
alias uint32_t = uint;
alias uint64_t = ulong;


struct GLFWcursor {
}
struct GLFWgamepadstate {
	ubyte[15] buttons;
	float[6] axes;
}
struct GLFWgammaramp {
	ushort* red;
	ushort* green;
	ushort* blue;
	uint size;
}
struct GLFWimage {
	int width;
	int height;
	ubyte* pixels;
}
struct GLFWmonitor {
}
struct GLFWvidmode {
	int width;
	int height;
	int redBits;
	int greenBits;
	int blueBits;
	int refreshRate;
}
struct GLFWwindow {
}


extern(Windows) { __gshared {

GLFWcursor* function(GLFWimage* image, int xhot, int yhot)
	glfwCreateCursor;

GLFWcursor* function(int shape)
	glfwCreateStandardCursor;

GLFWwindow* function(int width, int height, byte* title, GLFWmonitor* monitor, GLFWwindow* share)
	glfwCreateWindow;

VkResult function(VkInstance instance, GLFWwindow* window, VkAllocationCallbacks* allocator, VkSurfaceKHR* surface)
	glfwCreateWindowSurface;

void function()
	glfwDefaultWindowHints;

void function(GLFWcursor* cursor)
	glfwDestroyCursor;

void function(GLFWwindow* window)
	glfwDestroyWindow;

int function(byte* extension)
	glfwExtensionSupported;

void function(GLFWwindow* window)
	glfwFocusWindow;

byte* function(GLFWwindow* window)
	glfwGetClipboardString;

GLFWwindow* function()
	glfwGetCurrentContext;

void function(GLFWwindow* window, double* xpos, double* ypos)
	glfwGetCursorPos;

int function(byte** description)
	glfwGetError;

void function(GLFWwindow* window, int* width, int* height)
	glfwGetFramebufferSize;

byte* function(int jid)
	glfwGetGamepadName;

int function(int jid, GLFWgamepadstate* state)
	glfwGetGamepadState;

GLFWgammaramp* function(GLFWmonitor* monitor)
	glfwGetGammaRamp;

int function(GLFWwindow* window, int mode)
	glfwGetInputMode;

GLFWvkproc function(VkInstance instance, byte* procname)
	glfwGetInstanceProcAddress;

float* function(int jid, int* count)
	glfwGetJoystickAxes;

ubyte* function(int jid, int* count)
	glfwGetJoystickButtons;

byte* function(int jid)
	glfwGetJoystickGUID;

ubyte* function(int jid, int* count)
	glfwGetJoystickHats;

byte* function(int jid)
	glfwGetJoystickName;

void* function(int jid)
	glfwGetJoystickUserPointer;

int function(GLFWwindow* window, int key)
	glfwGetKey;

byte* function(int key, int scancode)
	glfwGetKeyName;

int function(int key)
	glfwGetKeyScancode;

void function(GLFWmonitor* monitor, float* xscale, float* yscale)
	glfwGetMonitorContentScale;

byte* function(GLFWmonitor* monitor)
	glfwGetMonitorName;

void function(GLFWmonitor* monitor, int* widthMM, int* heightMM)
	glfwGetMonitorPhysicalSize;

void function(GLFWmonitor* monitor, int* xpos, int* ypos)
	glfwGetMonitorPos;

void* function(GLFWmonitor* monitor)
	glfwGetMonitorUserPointer;

void function(GLFWmonitor* monitor, int* xpos, int* ypos, int* width, int* height)
	glfwGetMonitorWorkarea;

GLFWmonitor** function(int* count)
	glfwGetMonitors;

int function(GLFWwindow* window, int button)
	glfwGetMouseButton;

int function(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily)
	glfwGetPhysicalDevicePresentationSupport;

GLFWmonitor* function()
	glfwGetPrimaryMonitor;

GLFWglproc function(byte* procname)
	glfwGetProcAddress;

byte** function(uint32_t* count)
	glfwGetRequiredInstanceExtensions;

double function()
	glfwGetTime;

uint64_t function()
	glfwGetTimerFrequency;

uint64_t function()
	glfwGetTimerValue;

void function(int* major, int* minor, int* rev)
	glfwGetVersion;

byte* function()
	glfwGetVersionString;

GLFWvidmode* function(GLFWmonitor* monitor)
	glfwGetVideoMode;

GLFWvidmode* function(GLFWmonitor* monitor, int* count)
	glfwGetVideoModes;

int function(GLFWwindow* window, int attrib)
	glfwGetWindowAttrib;

void function(GLFWwindow* window, float* xscale, float* yscale)
	glfwGetWindowContentScale;

void function(GLFWwindow* window, int* left, int* top, int* right, int* bottom)
	glfwGetWindowFrameSize;

GLFWmonitor* function(GLFWwindow* window)
	glfwGetWindowMonitor;

float function(GLFWwindow* window)
	glfwGetWindowOpacity;

void function(GLFWwindow* window, int* xpos, int* ypos)
	glfwGetWindowPos;

void function(GLFWwindow* window, int* width, int* height)
	glfwGetWindowSize;

void* function(GLFWwindow* window)
	glfwGetWindowUserPointer;

void function(GLFWwindow* window)
	glfwHideWindow;

void function(GLFWwindow* window)
	glfwIconifyWindow;

int function()
	glfwInit;

void function(int hint, int value)
	glfwInitHint;

int function(int jid)
	glfwJoystickIsGamepad;

int function(int jid)
	glfwJoystickPresent;

void function(GLFWwindow* window)
	glfwMakeContextCurrent;

void function(GLFWwindow* window)
	glfwMaximizeWindow;

void function()
	glfwPollEvents;

void function()
	glfwPostEmptyEvent;

int function()
	glfwRawMouseMotionSupported;

void function(GLFWwindow* window)
	glfwRequestWindowAttention;

void function(GLFWwindow* window)
	glfwRestoreWindow;

GLFWcharfun function(GLFWwindow* window, GLFWcharfun callback)
	glfwSetCharCallback;

GLFWcharmodsfun function(GLFWwindow* window, GLFWcharmodsfun callback)
	glfwSetCharModsCallback;

void function(GLFWwindow* window, byte* string)
	glfwSetClipboardString;

void function(GLFWwindow* window, GLFWcursor* cursor)
	glfwSetCursor;

GLFWcursorenterfun function(GLFWwindow* window, GLFWcursorenterfun callback)
	glfwSetCursorEnterCallback;

void function(GLFWwindow* window, double xpos, double ypos)
	glfwSetCursorPos;

GLFWcursorposfun function(GLFWwindow* window, GLFWcursorposfun callback)
	glfwSetCursorPosCallback;

GLFWdropfun function(GLFWwindow* window, GLFWdropfun callback)
	glfwSetDropCallback;

GLFWerrorfun function(GLFWerrorfun callback)
	glfwSetErrorCallback;

GLFWframebuffersizefun function(GLFWwindow* window, GLFWframebuffersizefun callback)
	glfwSetFramebufferSizeCallback;

void function(GLFWmonitor* monitor, float gamma)
	glfwSetGamma;

void function(GLFWmonitor* monitor, GLFWgammaramp* ramp)
	glfwSetGammaRamp;

void function(GLFWwindow* window, int mode, int value)
	glfwSetInputMode;

GLFWjoystickfun function(GLFWjoystickfun callback)
	glfwSetJoystickCallback;

void function(int jid, void* pointer)
	glfwSetJoystickUserPointer;

GLFWkeyfun function(GLFWwindow* window, GLFWkeyfun callback)
	glfwSetKeyCallback;

GLFWmonitorfun function(GLFWmonitorfun callback)
	glfwSetMonitorCallback;

void function(GLFWmonitor* monitor, void* pointer)
	glfwSetMonitorUserPointer;

GLFWmousebuttonfun function(GLFWwindow* window, GLFWmousebuttonfun callback)
	glfwSetMouseButtonCallback;

GLFWscrollfun function(GLFWwindow* window, GLFWscrollfun callback)
	glfwSetScrollCallback;

void function(double time)
	glfwSetTime;

void function(GLFWwindow* window, int numer, int denom)
	glfwSetWindowAspectRatio;

void function(GLFWwindow* window, int attrib, int value)
	glfwSetWindowAttrib;

GLFWwindowclosefun function(GLFWwindow* window, GLFWwindowclosefun callback)
	glfwSetWindowCloseCallback;

GLFWwindowcontentscalefun function(GLFWwindow* window, GLFWwindowcontentscalefun callback)
	glfwSetWindowContentScaleCallback;

GLFWwindowfocusfun function(GLFWwindow* window, GLFWwindowfocusfun callback)
	glfwSetWindowFocusCallback;

void function(GLFWwindow* window, int count, GLFWimage* images)
	glfwSetWindowIcon;

GLFWwindowiconifyfun function(GLFWwindow* window, GLFWwindowiconifyfun callback)
	glfwSetWindowIconifyCallback;

GLFWwindowmaximizefun function(GLFWwindow* window, GLFWwindowmaximizefun callback)
	glfwSetWindowMaximizeCallback;

void function(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate)
	glfwSetWindowMonitor;

void function(GLFWwindow* window, float opacity)
	glfwSetWindowOpacity;

void function(GLFWwindow* window, int xpos, int ypos)
	glfwSetWindowPos;

GLFWwindowposfun function(GLFWwindow* window, GLFWwindowposfun callback)
	glfwSetWindowPosCallback;

GLFWwindowrefreshfun function(GLFWwindow* window, GLFWwindowrefreshfun callback)
	glfwSetWindowRefreshCallback;

void function(GLFWwindow* window, int value)
	glfwSetWindowShouldClose;

void function(GLFWwindow* window, int width, int height)
	glfwSetWindowSize;

GLFWwindowsizefun function(GLFWwindow* window, GLFWwindowsizefun callback)
	glfwSetWindowSizeCallback;

void function(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight)
	glfwSetWindowSizeLimits;

void function(GLFWwindow* window, byte* title)
	glfwSetWindowTitle;

void function(GLFWwindow* window, void* pointer)
	glfwSetWindowUserPointer;

void function(GLFWwindow* window)
	glfwShowWindow;

void function(GLFWwindow* window)
	glfwSwapBuffers;

void function(int interval)
	glfwSwapInterval;

void function()
	glfwTerminate;

int function(byte* string)
	glfwUpdateGamepadMappings;

int function()
	glfwVulkanSupported;

void function()
	glfwWaitEvents;

void function(double timeout)
	glfwWaitEventsTimeout;

void function(int hint, int value)
	glfwWindowHint;

void function(int hint, byte* value)
	glfwWindowHintString;

int function(GLFWwindow* window)
	glfwWindowShouldClose;

}}

