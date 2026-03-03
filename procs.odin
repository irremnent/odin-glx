package glx

import "vendor:x11/xlib"

// binds glX* procedures that are found in GL/glx.h on linux
// NOT opengl 1.1 procedures that are defined in GL/gl.h
foreign import glx "system:GL"
@(default_calling_convention="c", link_prefix="glX")
foreign glx {
    ChooseFBConfig :: proc(display: ^xlib.Display, screen: i32, attrib_list: [^]i32, num_items_out: ^i32) -> [^]FBConfig ---
    ChooseVisual :: proc(display: ^xlib.Display, screen: i32, attrib_list: [^]i32) -> ^xlib.XVisualInfo ---
    CopyContext :: proc(display: ^xlib.Display, src, dst: Context, mask: uint) ---
    CreateContext :: proc(display: ^xlib.Display, visual_info: ^xlib.XVisualInfo, share_list: Context, direct: b32) -> Context ---
    CreateGLXPixmap :: proc(display: ^xlib.Display, visual_info: ^xlib.XVisualInfo, pixmap: xlib.Pixmap) -> Pixmap ---
    CreateNewContext :: proc(display: ^xlib.Display, config: FBConfig, render_type: i32, share_list: Context, direct: b32) -> Context ---
    CreatePbuffer :: proc(display: ^xlib.Display, config: FBConfig, attrib_list: [^]i32) -> Pbuffer ---
    CreatePixmap :: proc(display: ^xlib.Display, config: FBConfig, pixmap: xlib.Pixmap, attrib_list: [^]i32) -> Pixmap ---
    CreateWindow :: proc(display: ^xlib.Display, config: FBConfig, window: ^xlib.Window, attrib_list: [^]i32) -> Window ---
    DestroyContext :: proc(display: ^xlib.Display, ctx: Context) ---
    DestroyGLXPixmap :: proc(display: ^xlib.Display, pixmap: Pixmap) ---
    DestroyPbuffer :: proc(display: ^xlib.Display, pbuffer: Pbuffer) ---
    DestroyPixmap :: proc(display: ^xlib.Display, pixmap: Pixmap) ---
    DestroyWindow :: proc(display: ^xlib.Display, window: Window) ---
    GetClientString :: proc(display: ^xlib.Display, name: i32) -> cstring ---
    GetConfig :: proc(display: ^xlib.Display, visual_info: ^xlib.XVisualInfo, attrib: i32, value_out: ^i32) -> Error ---
    GetCurrentContext :: proc() -> Context ---
    GetCurrentDisplay :: proc() -> ^xlib.Display ---
    GetCurrentDrawable :: proc() -> Drawable ---
    GetCurrentReadDrawable :: proc() -> Drawable ---
    GetFBConfigAttrib :: proc(display: ^xlib.Display, config: FBConfig, attrib: i32, value_out: ^i32) -> Error ---
    GetFBConfigs :: proc(display: ^xlib.Display, screen: i32, num_elements_out: ^i32) -> [^]FBConfig ---
    GetProcAddress :: proc(proc_name: cstring) -> rawptr ---
    GetSelectedEvent :: proc(display: ^xlib.Display, drawable: Drawable, mask: ^uint) ---
    GetVisualFromFBConfig :: proc(display: ^xlib.Display, config: FBConfig) -> ^xlib.XVisualInfo ---
    IsDirect :: proc(display: ^xlib.Display, ctx: Context) -> b32 ---
    MakeContextCurrent :: proc(display: ^xlib.Display, draw: Drawable, read: Drawable, ctx: Context) -> b32 ---
    MakeCurrent :: proc(display: ^xlib.Display, drawable: Drawable, ctx: Context) -> b32 ---
    QueryContext :: proc(display: ^xlib.Display, ctx: Context, attrib: i32, value_out: ^i32) -> Error ---
    QueryDrawable :: proc(display: ^xlib.Display, draw: Drawable, attrib: i32, value_out: ^u32) ---
    QueryExtension :: proc(display: ^xlib.Display, errorb, event: ^i32) -> b32 ---
    QueryExtensionsString :: proc(display: ^xlib.Display, screen: i32) -> cstring ---
    QueryServerString :: proc(display: ^xlib.Display, screen, name: i32) -> cstring ---
    QueryVersion :: proc(display: ^xlib.Display, maj, min: ^i32) -> b32 ---
    SelectEvent :: proc(display: ^xlib.Display, drawable: Drawable, mask: uint) ---
    SwapBuffers :: proc(display: ^xlib.Display, drawable: Drawable) ---
    UseXFont :: proc(font: xlib.Font, first, count, list: i32) ---
    WaitGL :: proc() ---
    WaitX :: proc() ---
}

// common extensions
CreateContextAttribsARB_Proc :: proc "c" (display: ^xlib.Display, config: FBConfig, share_context: Context, direct: b32, attrib_list: [^]i32) -> Context
SwapIntervalEXT_Proc :: proc "c" (display: ^xlib.Display, drawable: Drawable, interval: i32)

CreateContextAttribsARB: CreateContextAttribsARB_Proc
SwapIntervalEXT: SwapIntervalEXT_Proc

load_common_extensions :: proc() {
    CreateContextAttribsARB = cast(CreateContextAttribsARB_Proc)GetProcAddress("glXCreateContextAttribsARB")
    SwapIntervalEXT = cast(SwapIntervalEXT_Proc)GetProcAddress("glXSwapIntervalEXT")
}
