// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

@Native<Pointer<Void> Function(Size)>(symbol: 'vips_support_malloc')
external Pointer<Void> vips_support_malloc(int size);

@Native<Void Function(Pointer<Void>)>(symbol: 'vips_support_free')
external void vips_support_free(Pointer<Void> ptr);

typedef VipsSupportFreeCallbackNative
    = NativeFunction<Int Function(Pointer<Void>, Pointer<Void>)>;

@Native<Pointer<VipsSupportFreeCallbackNative> Function()>(
    symbol: 'vips_support_free_callback_ptr')
external Pointer<VipsSupportFreeCallbackNative>
    vips_support_free_callback_ptr();
