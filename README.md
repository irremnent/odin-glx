These are simple bindings for glx.

Most functions from `<GL/glx.h>` are bound. The main exceptions are the extensions. If you desire to use those, then you should query them with `glx.QueryExtension()`, and load them with `glx.GetProcAddress()`.

Two common and extremely useful extensions, `glx.CreateContextAttribsARB()` and `glx.SwapIntervalEXT()` can be loaded by calling `glx.load_common_extensions()`.
