import 'dart:ffi';
import 'dart:typed_data';

import 'bindings.dart';
import 'glib.dart';
import 'native_string.dart';
import 'support_bindings.dart';

typedef _VipsAreaUnref = NativeFunction<Void Function(Pointer<VipsArea>)>;

class Blob implements Finalizable {
  Blob._(this.pointer) {
    _finalizer.attach(
      this,
      pointer.cast(),
      externalSize: pointer.ref.area.length,
    );
  }

  factory Blob(int size) {
    return Blob._(vips_blob_new(
      vips_support_free_callback_ptr(),
      vips_support_malloc(size),
      size,
    ));
  }

  factory Blob.from(Uint8List data) =>
      Blob(data.length)..asTypedList().setAll(0, data);

  // ignore: non_constant_identifier_names
  static final _vips_are_unref_pointer =
      Native.addressOf<_VipsAreaUnref>(vips_area_unref);
  static final _finalizer = NativeFinalizer(_vips_are_unref_pointer.cast());

  final Pointer<VipsBlob> pointer;

  Uint8List asTypedList() {
    final area = pointer.ref.area;
    final data = area.data.cast<Uint8>();

    // Increment the ref count of the area.
    vips_area_copy(pointer.cast());

    return data.asTypedList(
      area.length,
      // Attach a finalizer to the returned Dart list. When the list is garbage
      // collected, the finalizer will decrement the ref count of the area.
      finalizer: _vips_are_unref_pointer.cast(),
      token: pointer.cast(),
    );
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
