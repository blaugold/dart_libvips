import 'dart:isolate';

import 'package:ffi/ffi.dart';

import 'bindings.dart';

/// Initialize the VIPS library.
///
/// If you are using VIPS only from the main [Isolate], you don't need to call
/// this function. It is called automatically when you start using the library.
///
/// If you are using VIPS from multiple [Isolate]s, you must call this function
/// before using VIPS in any other [Isolate] than the main one.
void initVips() {
  using((allocator) {
    // TODO: The docs talk about VIPS data files that are being loaded here.
    // Figure out if this is a problem for us, because we don't use a packaged
    // version of vips.
    // https://www.libvips.org/API/current/libvips-vips.html#VIPS-INIT:CAPS
    vips_init(''.toNativeUtf8(allocator: allocator).cast());
  });
}
