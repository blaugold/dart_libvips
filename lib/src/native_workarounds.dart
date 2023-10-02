import 'dart:ffi';

final _libvips = DynamicLibrary.process();

// ignore: non_constant_identifier_names
final g_object_unref_pointer =
    _libvips.lookup<NativeFunction<Void Function(Pointer)>>("g_object_unref");
