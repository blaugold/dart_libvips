import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'bindings.dart';
import 'native_string.dart';

class GlibValue implements Finalizable {
  factory GlibValue() => GlibValue._(calloc<GValue>());

  GlibValue._(this._pointer) {
    _finalizer.attach(this, _pointer.cast());
  }

  static final _finalizer = NativeFinalizer(calloc.nativeFree);

  final Pointer<GValue> _pointer;

  void init(int type) => g_value_init(_pointer, type);

  void unset() => g_value_unset(_pointer);

  bool get boolean => g_value_get_boolean(_pointer) != 0;

  set boolean(bool value) => g_value_set_boolean(_pointer, value ? 1 : 0);

  int get int_ => g_value_get_int(_pointer);

  set int_(int value) => g_value_set_int(_pointer, value);

  int get uint64 => g_value_get_uint64(_pointer);

  set uint64(int value) => g_value_set_uint64(_pointer, value);

  double get double_ => g_value_get_double(_pointer);

  set double_(double value) => g_value_set_double(_pointer, value);

  int get enum_ => g_value_get_enum(_pointer);

  set enum_(int value) => g_value_set_enum(_pointer, value);

  String? get string {
    final result = g_value_get_string(_pointer).cast<Utf8>();
    if (result == nullptr) {
      return null;
    }
    return result.toDartString();
  }

  set string(String? value) {
    using((allocator) {
      g_value_set_string(
        _pointer,
        (value?.toNativeUtf8(allocator: allocator) ?? nullptr).cast(),
      );
    });
  }

  Pointer<Void>? get object {
    final result = g_value_get_object(_pointer);
    if (result == nullptr) {
      return null;
    }
    return result;
  }

  set object(Pointer<Void>? value) =>
      g_value_set_object(_pointer, value ?? nullptr);

  Pointer<Void>? get boxed {
    final result = g_value_get_boxed(_pointer);
    if (result == nullptr) {
      return null;
    }
    return result;
  }

  set boxed(Pointer<Void>? value) =>
      g_value_set_boxed(_pointer, value ?? nullptr);
}

class GlibObject<T extends NativeType> implements Finalizable {
  GlibObject(this.pointer, {bool attachFinalizer = true}) {
    if (attachFinalizer) {
      _finalizer.attach(this, pointer.cast(), detach: this);
    }
  }

  static final _finalizer = NativeFinalizer(Native.addressOf(g_object_unref));
  static final _currentValue = GlibValue();

  final Pointer<T> pointer;

  void dispose({bool detachFinalizer = true}) {
    if (detachFinalizer) {
      _finalizer.detach(this);
    }
    g_object_unref(pointer.cast());
  }

  bool getBool(NativeString name) =>
      _getProperty(name, G_TYPE_BOOLEAN, () => _currentValue.boolean);

  void setBool(NativeString name, bool value) =>
      _setProperty(name, G_TYPE_BOOLEAN, () => _currentValue.boolean = value);

  int getInt(NativeString name) =>
      _getProperty(name, G_TYPE_INT, () => _currentValue.int_);

  void setInt(NativeString name, int value) =>
      _setProperty(name, G_TYPE_INT, () => _currentValue.int_ = value);

  int getUint64(NativeString name) =>
      _getProperty(name, G_TYPE_UINT64, () => _currentValue.uint64);

  void setUint64(NativeString name, int value) =>
      _setProperty(name, G_TYPE_UINT64, () => _currentValue.uint64 = value);

  double getDouble(NativeString name) =>
      _getProperty(name, G_TYPE_DOUBLE, () => _currentValue.double_);

  void setDouble(NativeString name, double value) =>
      _setProperty(name, G_TYPE_DOUBLE, () => _currentValue.double_ = value);

  int getEnum(NativeString name) =>
      _getProperty(name, G_TYPE_ENUM, () => _currentValue.enum_);

  void setEnum(NativeString name, int value) =>
      _setProperty(name, G_TYPE_ENUM, () => _currentValue.enum_ = value);

  R getDartEnum<R extends Enum>(NativeString name, Map<int, R> mapping) =>
      mapping[_getProperty(name, G_TYPE_ENUM, () => _currentValue.enum_)]!;

  void setDartEnum<R extends Enum>(
    NativeString name,
    Map<int, R> mapping,
    R value,
  ) =>
      _setProperty(
        name,
        G_TYPE_ENUM,
        () => _currentValue.enum_ =
            mapping.entries.firstWhere((entry) => entry.value == value).key,
      );

  String? getString(NativeString name) =>
      _getProperty(name, G_TYPE_STRING, () => _currentValue.string);

  void setString(NativeString name, String? value) =>
      _setProperty(name, G_TYPE_STRING, () => _currentValue.string = value);

  Pointer<Void>? getObject(NativeString name, int type) =>
      _getProperty(name, type, () => _currentValue.object);

  void setObject(NativeString name, int type, Pointer<Void>? value) =>
      _setProperty(name, type, () => _currentValue.object = value);

  Pointer<Void>? getBoxed(NativeString name, int type) =>
      _getProperty(name, type, () => _currentValue.boxed);

  void setBoxed(NativeString name, int type, Pointer<Void>? value) =>
      _setProperty(name, type, () => _currentValue.boxed = value);

  @pragma('vm:prefer-inline')
  R _getProperty<R>(NativeString name, int type, R Function() read) {
    _currentValue.init(type);
    g_object_get_property(
      pointer.cast(),
      name.native.cast(),
      _currentValue._pointer,
    );
    final result = read();
    _currentValue.unset();
    return result;
  }

  @pragma('vm:prefer-inline')
  void _setProperty<R>(NativeString name, int type, void Function() write) {
    _currentValue.init(type);
    write();
    g_object_set_property(
      pointer.cast(),
      name.native.cast(),
      _currentValue._pointer,
    );
    _currentValue.unset();
  }
}
