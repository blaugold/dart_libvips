// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';

class NativeString implements Finalizable {
  NativeString(String string)
      : dart = string,
        native = string.toNativeUtf8(allocator: malloc) {
    _finalizer.attach(this, native.cast());
  }

  static final _finalizer = NativeFinalizer(malloc.nativeFree);

  final String dart;
  final Pointer<Utf8> native;
}

final $bands = NativeString('bands');
final $buffer = NativeString('buffer');
final $coding = NativeString('coding');
final $colourspace = NativeString('colourspace');
final $demand = NativeString('demand');
final $direction = NativeString('direction');
final $extractArea = NativeString('extract_area');
final $eye = NativeString('eye');
final $factor = NativeString('factor');
final $filename = NativeString('filename');
final $flip = NativeString('flip');
final $format = NativeString('format');
final $height = NativeString('height');
final $in = NativeString('in');
final $input = NativeString('input');
final $interpretation = NativeString('interpretation');
final $lab2xyz = NativeString('Lab2XYZ');
final $left = NativeString('left');
final $n = NativeString('n');
final $out = NativeString('out');
final $page = NativeString('page');
final $postclose = NativeString('postclose');
final $scale = NativeString('scale');
final $sizeofHeader = NativeString('sizeof-header');
final $sourceSpace = NativeString('source_space');
final $space = NativeString('space');
final $top = NativeString('top');
final $uchar = NativeString('uchar');
final $webpload = NativeString('webpload');
final $webploadBuffer = NativeString('webpload_buffer');
final $webpsave = NativeString('webpsave');
final $webpsaveBuffer = NativeString('webpsave_buffer');
final $width = NativeString('width');
final $xoffset = NativeString('xoffset');
final $xres = NativeString('xres');
final $yoffset = NativeString('yoffset');
final $yres = NativeString('yres');
