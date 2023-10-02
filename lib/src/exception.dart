import 'package:ffi/ffi.dart';

import 'bindings.dart';

class VipsException implements Exception {
  VipsException(this.message);

  factory VipsException.withErrorBuffer(String message) {
    final errorBuffer = vips_error_buffer_copy();
    final errorBufferString = errorBuffer.cast<Utf8>().toDartString();
    malloc.free(errorBuffer);
    return VipsException('$message\n$errorBufferString');
  }

  final String message;

  @override
  String toString() => 'VipsException: $message';
}
