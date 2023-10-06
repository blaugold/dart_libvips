import 'dart:ffi';

import 'bindings.dart';
import 'exception.dart';
import 'glib.dart';
import 'native_string.dart';

class Operation extends GlibObject<VipsOperation> {
  Operation(NativeString name)
      : name = name.dart,
        super(vips_operation_new(name.native.cast()));

  final String name;

  T build<T>([T Function(GlibObject result)? resultHandler]) {
    GlibObject? result;
    try {
      final resultPointer = vips_cache_operation_build(pointer.cast());
      dispose();

      if (resultPointer == nullptr) {
        throw InternalVipsException.withErrorBuffer('Operation "$name" failed');
      }

      result = GlibObject(resultPointer.cast(), attachFinalizer: false);
      return resultHandler?.call(result) as T;
    } finally {
      if (result != null) {
        vips_object_unref_outputs(result.pointer.cast());
        result.dispose(detachFinalizer: false);
      }
    }
  }
}
