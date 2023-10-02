import 'package:ffi/ffi.dart';

import 'bindings.dart';

void initVips() {
  using((allocator) {
    // TODO: The docs talk about VIPS data files that are being loaded here.
    // Figure out if this is a problem for us, because we don't use a packaged
    // version of vips.
    // https://www.libvips.org/API/current/libvips-vips.html#VIPS-INIT:CAPS
    vips_init(''.toNativeUtf8(allocator: allocator).cast());
  });
}
