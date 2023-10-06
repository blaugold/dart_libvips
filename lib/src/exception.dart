import 'package:ffi/ffi.dart';

import 'bindings.dart';

/// Exception that is thrown when a VIPS operation fails.
class VipsException implements Exception {
  /// Create a new [VipsException] with the given [message].
  VipsException(this.message);

  /// Message describing the error.
  final String message;

  @override
  String toString() => 'VipsException: $message';
}

extension InternalVipsException on VipsException {
  static withErrorBuffer(String message) {
    final errorBuffer = vips_error_buffer_copy();
    final errorBufferString = errorBuffer.cast<Utf8>().toDartString();
    malloc.free(errorBuffer);
    return VipsException('$message\n$errorBufferString');
  }
}
