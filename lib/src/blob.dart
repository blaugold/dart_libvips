import 'dart:ffi';
import 'dart:typed_data';

import 'bindings.dart';
import 'glib.dart';
import 'native_string.dart';
import 'native_workarounds.dart' as workarounds;
import 'support_bindings.dart';

class Blob implements Finalizable {
  Blob._(this.pointer) {
    _finalizer.attach(
      this,
      pointer.cast(),
      externalSize: pointer.ref.area.length,
    );
  }

  factory Blob(int size) => Blob._(vips_blob_new(
        vips_support_free_callback_ptr(),
        vips_support_malloc(size),
        size,
      ));

  factory Blob.from(Uint8List data) => Blob(data.length)..view.setAll(0, data);

  static final _finalizer = NativeFinalizer(workarounds.vips_area_unref);

  final Pointer<VipsBlob> pointer;

  Uint8List get view {
    final area = pointer.ref.area;
    final data = area.data.cast<Uint8>();
    return data.asTypedList(area.length);
  }
}

extension GlibObjectBlobAccessors on GlibObject {
  Blob? getBlob(NativeString name) {
    final blob = getBoxed(name, vips_blob_get_type());
    if (blob == null) {
      return null;
    }

    // Increment the ref count of the blob. VipsBlobs are VipsAreas, just with
    // a length field.
    vips_area_copy(blob.cast());

    return Blob._(blob.cast());
  }

  void setBlob(NativeString name, Blob? blob) =>
      setBoxed(name, vips_blob_get_type(), blob?.pointer.cast());
}
