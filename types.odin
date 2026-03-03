package glx

import "vendor:x11/xlib"
import "core:c"
#assert(size_of(i32) == size_of(c.int))
#assert(size_of(u32) == size_of(c.uint))
#assert(size_of(uint) == size_of(c.ulong))

Context :: distinct rawptr
FBConfig :: distinct rawptr

Pixmap :: xlib.XID
Drawable :: xlib.XID
FBConfigID :: xlib.XID
ContextID :: xlib.XID
Window :: xlib.XID
Pbuffer :: xlib.XID

// TODO verify if glXGetConfig and other functions always return 0 on no error
// if so, add a "NONE = 0" field to this enum
Error :: enum i32 {
    BAD_SCREEN = BAD_SCREEN,
    BAD_ATTRIBUTE = BAD_ATTRIBUTE,
    NO_EXTENSION = NO_EXTENSION,
    BAD_VISUAL = BAD_VISUAL,
    BAD_CONTEXT = BAD_CONTEXT,
    BAD_VALUE = BAD_VALUE,
    BAD_ENUM = BAD_ENUM,
}
