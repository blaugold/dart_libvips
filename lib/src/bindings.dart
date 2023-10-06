// ignore_for_file: unused_element, unused_field

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Pointer<ffi.Char>>)>(
    symbol: 'g_strfreev')
external void g_strfreev(
  ffi.Pointer<ffi.Pointer<ffi.Char>> str_array,
);

@ffi.Native<
    ffi.Pointer<GValue> Function(
        ffi.Pointer<GValue>, ffi.UnsignedLong)>(symbol: 'g_value_init')
external ffi.Pointer<GValue> g_value_init(
  ffi.Pointer<GValue> value,
  int g_type,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>)>(symbol: 'g_value_unset')
external void g_value_unset(
  ffi.Pointer<GValue> value,
);

@ffi.Native<
    ffi.Void Function(ffi.Pointer<_GObject>, ffi.Pointer<ffi.Char>,
        ffi.Pointer<GValue>)>(symbol: 'g_object_set_property')
external void g_object_set_property(
  ffi.Pointer<_GObject> object,
  ffi.Pointer<ffi.Char> property_name,
  ffi.Pointer<GValue> value,
);

@ffi.Native<
    ffi.Void Function(ffi.Pointer<_GObject>, ffi.Pointer<ffi.Char>,
        ffi.Pointer<GValue>)>(symbol: 'g_object_get_property')
external void g_object_get_property(
  ffi.Pointer<_GObject> object,
  ffi.Pointer<ffi.Char> property_name,
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>(
    symbol: 'g_object_ref')
external ffi.Pointer<ffi.Void> g_object_ref(
  ffi.Pointer<ffi.Void> object,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(symbol: 'g_object_unref')
external void g_object_unref(
  ffi.Pointer<ffi.Void> object,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Pointer<ffi.Void>)>(
    symbol: 'g_value_set_object')
external void g_value_set_object(
  ffi.Pointer<GValue> value,
  ffi.Pointer<ffi.Void> v_object,
);

@ffi.Native<ffi.Pointer<ffi.Void> Function(ffi.Pointer<GValue>)>(
    symbol: 'g_value_get_object')
external ffi.Pointer<ffi.Void> g_value_get_object(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Int)>(
    symbol: 'g_value_set_enum')
external void g_value_set_enum(
  ffi.Pointer<GValue> value,
  int v_enum,
);

@ffi.Native<ffi.Int Function(ffi.Pointer<GValue>)>(symbol: 'g_value_get_enum')
external int g_value_get_enum(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Int)>(
    symbol: 'g_value_set_boolean')
external void g_value_set_boolean(
  ffi.Pointer<GValue> value,
  int v_boolean,
);

@ffi.Native<ffi.Int Function(ffi.Pointer<GValue>)>(
    symbol: 'g_value_get_boolean')
external int g_value_get_boolean(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Int)>(
    symbol: 'g_value_set_int')
external void g_value_set_int(
  ffi.Pointer<GValue> value,
  int v_int,
);

@ffi.Native<ffi.Int Function(ffi.Pointer<GValue>)>(symbol: 'g_value_get_int')
external int g_value_get_int(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.UnsignedLongLong)>(
    symbol: 'g_value_set_uint64')
external void g_value_set_uint64(
  ffi.Pointer<GValue> value,
  int v_uint64,
);

@ffi.Native<ffi.UnsignedLongLong Function(ffi.Pointer<GValue>)>(
    symbol: 'g_value_get_uint64')
external int g_value_get_uint64(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Double)>(
    symbol: 'g_value_set_double')
external void g_value_set_double(
  ffi.Pointer<GValue> value,
  double v_double,
);

@ffi.Native<ffi.Double Function(ffi.Pointer<GValue>)>(
    symbol: 'g_value_get_double')
external double g_value_get_double(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<GValue>, ffi.Pointer<ffi.Char>)>(
    symbol: 'g_value_set_string')
external void g_value_set_string(
  ffi.Pointer<GValue> value,
  ffi.Pointer<ffi.Char> v_string,
);

@ffi.Native<ffi.Pointer<ffi.Char> Function(ffi.Pointer<GValue>)>(
    symbol: 'g_value_get_string')
external ffi.Pointer<ffi.Char> g_value_get_string(
  ffi.Pointer<GValue> value,
);

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_object_get_type')
external int vips_object_get_type();

@ffi.Native<ffi.Void Function(ffi.Pointer<_VipsObject>)>(
    symbol: 'vips_object_unref_outputs')
external void vips_object_unref_outputs(
  ffi.Pointer<_VipsObject> object,
);

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_thing_get_type')
external int vips_thing_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_area_get_type')
external int vips_area_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_save_string_get_type')
external int vips_save_string_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_ref_string_get_type')
external int vips_ref_string_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_blob_get_type')
external int vips_blob_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_array_double_get_type')
external int vips_array_double_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_array_int_get_type')
external int vips_array_int_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_array_image_get_type')
external int vips_array_image_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_connection_get_type')
external int vips_connection_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_source_get_type')
external int vips_source_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_source_custom_get_type')
external int vips_source_custom_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_target_get_type')
external int vips_target_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_target_custom_get_type')
external int vips_target_custom_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_sbuf_get_type')
external int vips_sbuf_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_region_get_type')
external int vips_region_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_image_get_type')
external int vips_image_get_type();

@ffi.Native<ffi.Pointer<VipsImage> Function()>(symbol: 'vips_image_new')
external ffi.Pointer<VipsImage> vips_image_new();

@ffi.Native<ffi.Pointer<VipsImage> Function(ffi.Pointer<ffi.Char>)>(
    symbol: 'vips_image_new_from_file')
external ffi.Pointer<VipsImage> vips_image_new_from_file(
  ffi.Pointer<ffi.Char> name,
);

@ffi.Native<ffi.Pointer<ffi.Char> Function()>(symbol: 'vips_error_buffer_copy')
external ffi.Pointer<ffi.Char> vips_error_buffer_copy();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_format_get_type')
external int vips_format_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_interpolate_get_type')
external int vips_interpolate_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_thread_state_get_type')
external int vips_thread_state_get_type();

@ffi.Native<ffi.Int32 Function(ffi.Pointer<VipsImage>)>(
    symbol: 'vips_image_guess_interpretation')
external int vips_image_guess_interpretation(
  ffi.Pointer<VipsImage> image,
);

@ffi.Native<
    ffi.Pointer<ffi.Pointer<ffi.Char>> Function(
        ffi.Pointer<VipsImage>)>(symbol: 'vips_image_get_fields')
external ffi.Pointer<ffi.Pointer<ffi.Char>> vips_image_get_fields(
  ffi.Pointer<VipsImage> image,
);

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_operation_get_type')
external int vips_operation_get_type();

@ffi.Native<ffi.Pointer<VipsOperation> Function(ffi.Pointer<ffi.Char>)>(
    symbol: 'vips_operation_new')
external ffi.Pointer<VipsOperation> vips_operation_new(
  ffi.Pointer<ffi.Char> name,
);

@ffi.Native<ffi.Pointer<VipsOperation> Function(ffi.Pointer<VipsOperation>)>(
    symbol: 'vips_cache_operation_build')
external ffi.Pointer<VipsOperation> vips_cache_operation_build(
  ffi.Pointer<VipsOperation> operation,
);

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_foreign_get_type')
external int vips_foreign_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_foreign_load_get_type')
external int vips_foreign_load_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_foreign_save_get_type')
external int vips_foreign_save_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_operation_math_get_type')
external int vips_operation_math_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_math2_get_type')
external int vips_operation_math2_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_round_get_type')
external int vips_operation_round_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_relational_get_type')
external int vips_operation_relational_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_boolean_get_type')
external int vips_operation_boolean_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_complex_get_type')
external int vips_operation_complex_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_complex2_get_type')
external int vips_operation_complex2_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_complexget_get_type')
external int vips_operation_complexget_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_precision_get_type')
external int vips_precision_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_intent_get_type')
external int vips_intent_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_pcs_get_type')
external int vips_pcs_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_extend_get_type')
external int vips_extend_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_compass_direction_get_type')
external int vips_compass_direction_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_direction_get_type')
external int vips_direction_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_align_get_type')
external int vips_align_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_angle_get_type')
external int vips_angle_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_angle45_get_type')
external int vips_angle45_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_interesting_get_type')
external int vips_interesting_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_blend_mode_get_type')
external int vips_blend_mode_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_combine_get_type')
external int vips_combine_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_text_wrap_get_type')
external int vips_text_wrap_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_combine_mode_get_type')
external int vips_combine_mode_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_foreign_flags_get_type')
external int vips_foreign_flags_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_fail_on_get_type')
external int vips_fail_on_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_saveable_get_type')
external int vips_saveable_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_subsample_get_type')
external int vips_foreign_subsample_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_jpeg_subsample_get_type')
external int vips_foreign_jpeg_subsample_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_webp_preset_get_type')
external int vips_foreign_webp_preset_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_tiff_compression_get_type')
external int vips_foreign_tiff_compression_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_tiff_predictor_get_type')
external int vips_foreign_tiff_predictor_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_tiff_resunit_get_type')
external int vips_foreign_tiff_resunit_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_png_filter_get_type')
external int vips_foreign_png_filter_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_ppm_format_get_type')
external int vips_foreign_ppm_format_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_dz_layout_get_type')
external int vips_foreign_dz_layout_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_dz_depth_get_type')
external int vips_foreign_dz_depth_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_dz_container_get_type')
external int vips_foreign_dz_container_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_heif_compression_get_type')
external int vips_foreign_heif_compression_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_foreign_heif_encoder_get_type')
external int vips_foreign_heif_encoder_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_demand_style_get_type')
external int vips_demand_style_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_image_type_get_type')
external int vips_image_type_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_interpretation_get_type')
external int vips_interpretation_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_band_format_get_type')
external int vips_band_format_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_coding_get_type')
external int vips_coding_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_access_get_type')
external int vips_access_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_morphology_get_type')
external int vips_operation_morphology_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_argument_flags_get_type')
external int vips_argument_flags_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(
    symbol: 'vips_operation_flags_get_type')
external int vips_operation_flags_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_region_shrink_get_type')
external int vips_region_shrink_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_kernel_get_type')
external int vips_kernel_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_size_get_type')
external int vips_size_get_type();

@ffi.Native<ffi.UnsignedLong Function()>(symbol: 'vips_token_get_type')
external int vips_token_get_type();

@ffi.Native<ffi.Int Function(ffi.Pointer<VipsImage>)>(
    symbol: 'vips_colourspace_issupported')
external int vips_colourspace_issupported(
  ffi.Pointer<VipsImage> image,
);

@ffi.Native<ffi.Int Function(ffi.Pointer<ffi.Char>)>(symbol: 'vips_init')
external int vips_init(
  ffi.Pointer<ffi.Char> argv0,
);

typedef GValue = _GValue;

/// GValue:
///
/// An opaque structure used to hold different types of values.
///
/// The data within the structure has protected scope: it is accessible only
/// to functions within a #GTypeValueTable structure, or implementations of
/// the g_value_*() API. That is, code portions which implement new fundamental
/// types.
///
/// #GValue users cannot make any assumptions about how data is stored
/// within the 2 element @data union, and the @g_type member should
/// only be accessed through the G_VALUE_TYPE() macro.
final class _GValue extends ffi.Struct {
  @ffi.UnsignedLong()
  external int g_type;

  @ffi.Array.multi([2])
  external ffi.Array<UnnamedUnion1> data;
}

final class UnnamedUnion1 extends ffi.Union {
  @ffi.Int()
  external int v_int;

  @ffi.UnsignedInt()
  external int v_uint;

  @ffi.Long()
  external int v_long;

  @ffi.UnsignedLong()
  external int v_ulong;

  @ffi.LongLong()
  external int v_int64;

  @ffi.UnsignedLongLong()
  external int v_uint64;

  @ffi.Float()
  external double v_float;

  @ffi.Double()
  external double v_double;

  external ffi.Pointer<ffi.Void> v_pointer;
}

/// GObject:
///
/// The base object type.
///
/// All the fields in the `GObject` structure are private to the implementation
/// and should never be accessed directly.
///
/// Since GLib 2.72, all #GObjects are guaranteed to be aligned to at least the
/// alignment of the largest basic GLib type (typically this is #guint64 or
/// #gdouble). If you need larger alignment for an element in a #GObject, you
/// should allocate it on the heap (aligned), or arrange for your #GObject to be
/// appropriately padded. This guarantee applies to the #GObject (or derived)
/// struct, the #GObjectClass (or derived) struct, and any private data allocated
/// by G_ADD_PRIVATE().
final class _GObject extends ffi.Struct {
  external _GTypeInstance g_type_instance;

  @ffi.UnsignedInt()
  external int ref_count;

  external ffi.Pointer<_GData> qdata;
}

/// GTypeInstance:
///
/// An opaque structure used as the base of all type instances.
final class _GTypeInstance extends ffi.Struct {
  external ffi.Pointer<_GTypeClass> g_class;
}

/// GTypeClass:
///
/// An opaque structure used as the base of all classes.
final class _GTypeClass extends ffi.Struct {
  @ffi.UnsignedLong()
  external int g_type;
}

final class _GData extends ffi.Opaque {}

final class _VipsObject extends ffi.Struct {
  external _GObject parent_instance;

  @ffi.Int()
  external int constructed;

  @ffi.Int()
  external int static_object;

  external ffi.Pointer<_GHashTable> argument_table;

  external ffi.Pointer<ffi.Char> nickname;

  external ffi.Pointer<ffi.Char> description;

  @ffi.Int()
  external int preclose;

  @ffi.Int()
  external int close;

  @ffi.Int()
  external int postclose;

  @ffi.Size()
  external int local_memory;
}

final class _GHashTable extends ffi.Opaque {}

typedef VipsImage = _VipsImage;

final class _VipsImage extends ffi.Struct {
  external _VipsObject parent_instance;

  @ffi.Int()
  external int Xsize;

  @ffi.Int()
  external int Ysize;

  @ffi.Int()
  external int Bands;

  @ffi.Int32()
  external int BandFmt;

  @ffi.Int32()
  external int Coding;

  @ffi.Int32()
  external int Type;

  @ffi.Double()
  external double Xres;

  @ffi.Double()
  external double Yres;

  @ffi.Int()
  external int Xoffset;

  @ffi.Int()
  external int Yoffset;

  @ffi.Int()
  external int Length;

  @ffi.Short()
  external int Compression;

  @ffi.Short()
  external int Level;

  @ffi.Int()
  external int Bbits;

  external ffi.Pointer<_VipsProgress> time;

  external ffi.Pointer<ffi.Char> Hist;

  external ffi.Pointer<ffi.Char> filename;

  external ffi.Pointer<ffi.UnsignedChar> data;

  @ffi.Int()
  external int kill;

  @ffi.Float()
  external double Xres_float;

  @ffi.Float()
  external double Yres_float;

  external ffi.Pointer<ffi.Char> mode;

  @ffi.Int32()
  external int dtype;

  @ffi.Int()
  external int fd;

  external ffi.Pointer<ffi.Void> baseaddr;

  @ffi.Size()
  external int length;

  @ffi.UnsignedInt()
  external int magic;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(ffi.Pointer<VipsImage1>,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>> start_fn;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<_VipsRegion>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Int>)>> generate_fn;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>)>> stop_fn;

  external ffi.Pointer<ffi.Void> client1;

  external ffi.Pointer<ffi.Void> client2;

  external ffi.Pointer<_GMutex> sslock;

  external ffi.Pointer<_GSList> regions;

  @ffi.Int32()
  external int dhint;

  external ffi.Pointer<_GHashTable> meta;

  external ffi.Pointer<_GSList> meta_traverse;

  @ffi.LongLong()
  external int sizeof_header;

  external ffi.Pointer<_GSList> windows;

  external ffi.Pointer<_GSList> upstream;

  external ffi.Pointer<_GSList> downstream;

  @ffi.Int()
  external int serial;

  external ffi.Pointer<_GSList> history_list;

  external ffi.Pointer<VipsImage1> progress_signal;

  @ffi.LongLong()
  external int file_length;

  @ffi.Int()
  external int hint_set;

  @ffi.Int()
  external int delete_on_close;

  external ffi.Pointer<ffi.Char> delete_on_close_filename;
}

abstract class VipsBandFormat {
  static const int VIPS_FORMAT_NOTSET = -1;
  static const int VIPS_FORMAT_UCHAR = 0;
  static const int VIPS_FORMAT_CHAR = 1;
  static const int VIPS_FORMAT_USHORT = 2;
  static const int VIPS_FORMAT_SHORT = 3;
  static const int VIPS_FORMAT_UINT = 4;
  static const int VIPS_FORMAT_INT = 5;
  static const int VIPS_FORMAT_FLOAT = 6;
  static const int VIPS_FORMAT_COMPLEX = 7;
  static const int VIPS_FORMAT_DOUBLE = 8;
  static const int VIPS_FORMAT_DPCOMPLEX = 9;
  static const int VIPS_FORMAT_LAST = 10;
}

abstract class VipsCoding {
  static const int VIPS_CODING_ERROR = -1;
  static const int VIPS_CODING_NONE = 0;
  static const int VIPS_CODING_LABQ = 2;
  static const int VIPS_CODING_RAD = 6;
  static const int VIPS_CODING_LAST = 7;
}

abstract class VipsInterpretation {
  static const int VIPS_INTERPRETATION_ERROR = -1;
  static const int VIPS_INTERPRETATION_MULTIBAND = 0;
  static const int VIPS_INTERPRETATION_B_W = 1;
  static const int VIPS_INTERPRETATION_HISTOGRAM = 10;
  static const int VIPS_INTERPRETATION_XYZ = 12;
  static const int VIPS_INTERPRETATION_LAB = 13;
  static const int VIPS_INTERPRETATION_CMYK = 15;
  static const int VIPS_INTERPRETATION_LABQ = 16;
  static const int VIPS_INTERPRETATION_RGB = 17;
  static const int VIPS_INTERPRETATION_CMC = 18;
  static const int VIPS_INTERPRETATION_LCH = 19;
  static const int VIPS_INTERPRETATION_LABS = 21;
  static const int VIPS_INTERPRETATION_sRGB = 22;
  static const int VIPS_INTERPRETATION_YXY = 23;
  static const int VIPS_INTERPRETATION_FOURIER = 24;
  static const int VIPS_INTERPRETATION_RGB16 = 25;
  static const int VIPS_INTERPRETATION_GREY16 = 26;
  static const int VIPS_INTERPRETATION_MATRIX = 27;
  static const int VIPS_INTERPRETATION_scRGB = 28;
  static const int VIPS_INTERPRETATION_HSV = 29;
  static const int VIPS_INTERPRETATION_LAST = 30;
}

final class _VipsProgress extends ffi.Struct {
  external ffi.Pointer<VipsImage1> im;

  @ffi.Int()
  external int run;

  @ffi.Int()
  external int eta;

  @ffi.LongLong()
  external int tpels;

  @ffi.LongLong()
  external int npels;

  @ffi.Int()
  external int percent;

  external ffi.Pointer<_GTimer> start;
}

typedef VipsImage1 = _VipsImage;

final class _GTimer extends ffi.Opaque {}

abstract class VipsImageType {
  static const int VIPS_IMAGE_ERROR = -1;
  static const int VIPS_IMAGE_NONE = 0;
  static const int VIPS_IMAGE_SETBUF = 1;
  static const int VIPS_IMAGE_SETBUF_FOREIGN = 2;
  static const int VIPS_IMAGE_OPENIN = 3;
  static const int VIPS_IMAGE_MMAPIN = 4;
  static const int VIPS_IMAGE_MMAPINRW = 5;
  static const int VIPS_IMAGE_OPENOUT = 6;
  static const int VIPS_IMAGE_PARTIAL = 7;
}

final class _VipsRegion extends ffi.Struct {
  external _VipsObject parent_object;

  external ffi.Pointer<VipsImage1> im;

  external _VipsRect valid;

  @ffi.Int32()
  external int type;

  external ffi.Pointer<ffi.UnsignedChar> data;

  @ffi.Int()
  external int bpl;

  external ffi.Pointer<ffi.Void> seq;

  external ffi.Pointer<_GThread> thread;

  external ffi.Pointer<VipsWindow> window;

  external ffi.Pointer<_VipsBuffer> buffer;

  @ffi.Int()
  external int invalid;
}

final class _VipsRect extends ffi.Struct {
  @ffi.Int()
  external int left;

  @ffi.Int()
  external int top;

  @ffi.Int()
  external int width;

  @ffi.Int()
  external int height;
}

abstract class _RegionType {
  static const int VIPS_REGION_NONE = 0;
  static const int VIPS_REGION_BUFFER = 1;
  static const int VIPS_REGION_OTHER_REGION = 2;
  static const int VIPS_REGION_OTHER_IMAGE = 3;
  static const int VIPS_REGION_WINDOW = 4;
}

final class _GThread extends ffi.Struct {
  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>> func;

  external ffi.Pointer<ffi.Void> data;

  @ffi.Int()
  external int joinable;

  @ffi.Int32()
  external int priority;
}

abstract class GThreadPriority {
  static const int G_THREAD_PRIORITY_LOW = 0;
  static const int G_THREAD_PRIORITY_NORMAL = 1;
  static const int G_THREAD_PRIORITY_HIGH = 2;
  static const int G_THREAD_PRIORITY_URGENT = 3;
}

final class VipsWindow extends ffi.Struct {
  @ffi.Int()
  external int ref_count;

  external ffi.Pointer<_VipsImage> im;

  @ffi.Int()
  external int top;

  @ffi.Int()
  external int height;

  external ffi.Pointer<ffi.UnsignedChar> data;

  external ffi.Pointer<ffi.Void> baseaddr;

  @ffi.Size()
  external int length;
}

final class _VipsBuffer extends ffi.Struct {
  @ffi.Int()
  external int ref_count;

  external ffi.Pointer<_VipsImage> im;

  external _VipsRect area;

  @ffi.Int()
  external int done;

  external ffi.Pointer<_VipsBufferCache> cache;

  external ffi.Pointer<ffi.UnsignedChar> buf;

  @ffi.Size()
  external int bsize;
}

final class _VipsBufferCache extends ffi.Struct {
  external ffi.Pointer<_GSList> buffers;

  external ffi.Pointer<_GThread> thread;

  external ffi.Pointer<_VipsImage> im;

  external ffi.Pointer<VipsBufferThread> buffer_thread;

  external ffi.Pointer<_GSList> reserve;

  @ffi.Int()
  external int n_reserve;
}

final class _GSList extends ffi.Struct {
  external ffi.Pointer<ffi.Void> data;

  external ffi.Pointer<_GSList> next;
}

final class VipsBufferThread extends ffi.Struct {
  external ffi.Pointer<_GHashTable> hash;

  external ffi.Pointer<_GThread> thread;
}

final class _GMutex extends ffi.Union {
  external ffi.Pointer<ffi.Void> p;

  @ffi.Array.multi([2])
  external ffi.Array<ffi.UnsignedInt> i;
}

abstract class VipsDemandStyle {
  static const int VIPS_DEMAND_STYLE_ERROR = -1;
  static const int VIPS_DEMAND_STYLE_SMALLTILE = 0;
  static const int VIPS_DEMAND_STYLE_FATSTRIP = 1;
  static const int VIPS_DEMAND_STYLE_THINSTRIP = 2;
  static const int VIPS_DEMAND_STYLE_ANY = 3;
}

typedef VipsOperation = _VipsOperation;

final class _VipsOperation extends ffi.Struct {
  external _VipsObject parent_instance;

  @ffi.UnsignedInt()
  external int hash;

  @ffi.Int()
  external int found_hash;

  @ffi.Int()
  external int pixels;
}

abstract class VipsDirection {
  static const int VIPS_DIRECTION_HORIZONTAL = 0;
  static const int VIPS_DIRECTION_VERTICAL = 1;
  static const int VIPS_DIRECTION_LAST = 2;
}

const int G_TYPE_FUNDAMENTAL_MAX = 1020;

const int G_TYPE_INVALID = 0;

const int G_TYPE_NONE = 4;

const int G_TYPE_INTERFACE = 8;

const int G_TYPE_CHAR = 12;

const int G_TYPE_UCHAR = 16;

const int G_TYPE_BOOLEAN = 20;

const int G_TYPE_INT = 24;

const int G_TYPE_UINT = 28;

const int G_TYPE_LONG = 32;

const int G_TYPE_ULONG = 36;

const int G_TYPE_INT64 = 40;

const int G_TYPE_UINT64 = 44;

const int G_TYPE_ENUM = 48;

const int G_TYPE_FLAGS = 52;

const int G_TYPE_FLOAT = 56;

const int G_TYPE_DOUBLE = 60;

const int G_TYPE_STRING = 64;

const int G_TYPE_POINTER = 68;

const int G_TYPE_BOXED = 72;

const int G_TYPE_PARAM = 76;

const int G_TYPE_OBJECT = 80;

const int G_TYPE_VARIANT = 84;

const int G_TYPE_FUNDAMENTAL_SHIFT = 2;

const int G_TYPE_RESERVED_GLIB_FIRST = 22;

const int G_TYPE_RESERVED_GLIB_LAST = 31;

const int G_TYPE_RESERVED_BSE_FIRST = 32;

const int G_TYPE_RESERVED_BSE_LAST = 48;

const int G_TYPE_RESERVED_USER_FIRST = 49;

const int G_TYPE_FLAG_RESERVED_ID_BIT = 1;