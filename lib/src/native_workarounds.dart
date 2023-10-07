// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

final _libvips = DynamicLibrary.process();

final g_object_unref_pointer =
    _libvips.lookup<NativeFunction<Void Function(Pointer)>>("g_object_unref");

final vips_area_unref = _libvips
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>("vips_area_unref");
