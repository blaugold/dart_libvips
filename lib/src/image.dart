import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'bindings.dart';
import 'blob.dart';
import 'glib.dart';
import 'native_string.dart';
import 'operation.dart';

/// The format used for each element of a band of an [Image].
///
/// Each corresponds to a native C type for the current machine. For example,
/// [ushort] is `unsigned short`.
enum BandFormat {
  /// Invalid setting
  notSet,

  /// `unsigned char`
  uchar,

  /// `char`
  char,

  /// `unsigned short`
  ushort,

  /// `short`
  short,

  /// `unsigned int`
  uint,

  /// `int`
  int,

  /// `float`
  float,

  /// `complex` (two floats)
  complex,

  /// `double float`
  double,

  /// `double complex` (two doubles)
  doubleComplex;

  static const _cEnumMapping = {
    VipsBandFormat.VIPS_FORMAT_NOTSET: BandFormat.notSet,
    VipsBandFormat.VIPS_FORMAT_UCHAR: BandFormat.uchar,
    VipsBandFormat.VIPS_FORMAT_CHAR: BandFormat.char,
    VipsBandFormat.VIPS_FORMAT_USHORT: BandFormat.ushort,
    VipsBandFormat.VIPS_FORMAT_SHORT: BandFormat.short,
    VipsBandFormat.VIPS_FORMAT_UINT: BandFormat.uint,
    VipsBandFormat.VIPS_FORMAT_INT: BandFormat.int,
    VipsBandFormat.VIPS_FORMAT_FLOAT: BandFormat.float,
    VipsBandFormat.VIPS_FORMAT_COMPLEX: BandFormat.complex,
    VipsBandFormat.VIPS_FORMAT_DOUBLE: BandFormat.double,
    VipsBandFormat.VIPS_FORMAT_DPCOMPLEX: BandFormat.doubleComplex,
  };
}

/// How the values in an [Image] should be interpreted.
///
/// For example, a three-band float image of type [lab] should have its pixels
/// interpreted as coordinates in CIE Lab space.
///
/// RGB and sRGB are treated in the same way. Use the [Image.toColourSpace] and
/// related functions if you want some other behaviour.
enum Interpretation {
  /// Invalid setting
  error,

  /// Generic many-band image
  multiBand,

  /// Some kind of single-band image
  bw,

  /// A 1D image, eg. histogram or lookup table
  histogram,

  /// The first three bands are CIE XYZ
  xyz,

  /// Pixels are in CIE Lab space
  lab,

  /// The first four bands are in CMYK space
  cmyk,

  /// Implies [Coding.labq]
  labq,

  /// Generic RGB space
  rgb,

  /// A uniform colourspace based on CMC(1:1)
  cmc,

  /// Pixels are in CIE LCh space
  lch,

  /// CIE LAB coded as three signed 16-bit values
  labs,

  /// Pixels are sRGB
  srgb,

  /// Pixels are CIE Yxy
  yxy,

  /// Image is in fourier space
  fourier,

  /// Generic 16-bit RGB
  rgb16,

  /// Generic 16-bit mono
  grey16,

  /// A matrix
  matrix,

  /// Pixels are scRGB
  scrgb,

  /// Pixels are HSV
  hsv;

  static const _cEnumMapping = {
    VipsInterpretation.VIPS_INTERPRETATION_ERROR: Interpretation.error,
    VipsInterpretation.VIPS_INTERPRETATION_MULTIBAND: Interpretation.multiBand,
    VipsInterpretation.VIPS_INTERPRETATION_B_W: Interpretation.bw,
    VipsInterpretation.VIPS_INTERPRETATION_HISTOGRAM: Interpretation.histogram,
    VipsInterpretation.VIPS_INTERPRETATION_XYZ: Interpretation.xyz,
    VipsInterpretation.VIPS_INTERPRETATION_LAB: Interpretation.lab,
    VipsInterpretation.VIPS_INTERPRETATION_CMYK: Interpretation.cmyk,
    VipsInterpretation.VIPS_INTERPRETATION_LABQ: Interpretation.labq,
    VipsInterpretation.VIPS_INTERPRETATION_RGB: Interpretation.rgb,
    VipsInterpretation.VIPS_INTERPRETATION_CMC: Interpretation.cmc,
    VipsInterpretation.VIPS_INTERPRETATION_LCH: Interpretation.lch,
    VipsInterpretation.VIPS_INTERPRETATION_LABS: Interpretation.labs,
    VipsInterpretation.VIPS_INTERPRETATION_sRGB: Interpretation.srgb,
    VipsInterpretation.VIPS_INTERPRETATION_YXY: Interpretation.yxy,
    VipsInterpretation.VIPS_INTERPRETATION_FOURIER: Interpretation.fourier,
    VipsInterpretation.VIPS_INTERPRETATION_RGB16: Interpretation.rgb16,
    VipsInterpretation.VIPS_INTERPRETATION_GREY16: Interpretation.grey16,
    VipsInterpretation.VIPS_INTERPRETATION_MATRIX: Interpretation.matrix,
    VipsInterpretation.VIPS_INTERPRETATION_scRGB: Interpretation.scrgb,
    VipsInterpretation.VIPS_INTERPRETATION_HSV: Interpretation.hsv,
  };
}

/// How pixels are coded.
///
/// Normally, pixels are uncoded and can be manipulated as you would expect.
/// However some file formats code pixels for compression, and sometimes it's
/// useful to be able to manipulate images in the coded format.
enum Coding {
  /// Invalid setting
  error,

  /// Pixels are not coded
  none,

  /// Pixels encode 3 float CIE LAB values as 4 uchar
  labq,

  /// Pixels encode 3 float RGB as 4 uchar (Radiance coding)
  rad;

  static const _cEnumMapping = {
    VipsCoding.VIPS_CODING_ERROR: Coding.error,
    VipsCoding.VIPS_CODING_NONE: Coding.none,
    VipsCoding.VIPS_CODING_LABQ: Coding.labq,
    VipsCoding.VIPS_CODING_RAD: Coding.rad,
  };
}

/// Hint to the VIPS image IO system about the kind of demand geometry they
/// prefer.
enum DemandStyle {
  /// Invalid setting
  error,

  /// Demand in small (typically 64x64 pixel) tiles.
  ///
  /// This is the most general demand format. Output is demanded in small
  /// (around 100x100 pel) sections. This style works reasonably efficiently,
  /// even for bizarre operations like 45 degree rotate.
  smallTile,

  /// Demand in fat (typically 10 pixel high) strips.
  ///
  /// This operation would like to output strips the width of the image and as
  /// high as possible. This option is suitable for area operations which do not
  /// violently transform coordinates, such as [Image.conv].
  fatStrip,

  /// Demand in thin (typically 1 pixel high) strips.
  ///
  /// This operation would like to output strips the width of the image and a
  /// few pels high. This is option suitable for point-to-point operations,
  /// e.g. arithmetic operations.
  ///
  /// This option is only efficient for cases where each output pel depends upon
  /// the pel in the corresponding position in the input image.
  thinStrip,

  /// Demand geometry does not matter.
  ///
  /// This image is not being demand-read from a disc file (even indirectly) so
  /// any demand style is OK. It's used for things like [Image.black] where the
  /// pixels are calculated.
  any;

  static const _cEnumMapping = {
    VipsDemandStyle.VIPS_DEMAND_STYLE_ERROR: DemandStyle.error,
    VipsDemandStyle.VIPS_DEMAND_STYLE_SMALLTILE: DemandStyle.smallTile,
    VipsDemandStyle.VIPS_DEMAND_STYLE_FATSTRIP: DemandStyle.fatStrip,
    VipsDemandStyle.VIPS_DEMAND_STYLE_THINSTRIP: DemandStyle.thinStrip,
    VipsDemandStyle.VIPS_DEMAND_STYLE_ANY: DemandStyle.any,
  };
}

/// The direction of a [Image.flip] or [Image.join] operation.
enum Direction {
  /// Left to right.
  horizontal,

  /// Top to bottom.
  vertical;

  static const _cEnumMapping = {
    VipsDirection.VIPS_DIRECTION_HORIZONTAL: Direction.horizontal,
    VipsDirection.VIPS_DIRECTION_VERTICAL: Direction.vertical,
  };
}

/// Representation of an image in VIPS.
///
/// Creating an image is fast. VIPS reads just enough of the image to be able to
/// get the various properties, such as width in pixels. It delays reading any
/// pixels until they are really needed.
///
/// VIPS images are three-dimensional arrays, the dimensions being [width],
/// [height] and [bands]. Each dimension can be up to 2 ** 31 pixels (or band
/// elements). An image has a [format], meaning the machine number type used to
/// represent each
/// value. VIPS supports 10 formats, from 8-bit unsigned integer up to 128-bit
/// double complex, see [BandFormat].
///
/// In VIPS, images are uninterpreted arrays, meaning that from the point of
/// view of most operations, they are just large collections of numbers. There's
/// no difference between an RGBA (RGB with alpha) image and a CMYK image, for
/// example, they are both just four-band images. It's up to the user of the
/// library to use the right sort of image with each operation.
///
/// To take an example, VIPS has [labToXyz], an operation to transform an
/// image from CIE LAB colour space to CIE XYZ space. It assumes the first three
/// bands represent pixels in LAB colour space and returns an image where the
/// first three bands are transformed to XYZ and any remaining bands are just
/// copied. Pass it a RGB image by mistake and you'll just get nonsense.
///
/// VIPS has a feature to help (a little) with this: it sets an [Interpretation]
/// hint for each image; a hint which says how pixels should be interpreted. For
/// example, [labToXyz] will set the [interpretation] of the output image to
/// [Interpretation.xyz]. A few utility operations will also use
/// [interpretation] as a guide. For example, you can give [toColourSpace] an
/// input image and a desired colour space and it will use the input's
/// interpretation hint to apply the best sequence of colour space transforms to
/// get to the desired space.
///
/// Use things like [invert] to manipulate your images. When you are done, you
/// can write images to disc files (with vips_image_write_to_file() TODO), to
/// formatted memory buffers (with vips_image_write_to_buffer() TODO) and to
/// C-style memory arrays (with vips_image_write_to_memory() TODO).
///
/// You can also write images to other images. Create, for example, a temporary
/// disc image with vips_image_new_temp_file() TODO, then write your image to
/// that with vips_image_write() TODO. You can create several other types of
/// image and write to them, see vips_image_new_memory() TODO, for example.
class Image {
  factory Image() => Image._(vips_image_new());

  factory Image.fromWebPFile(
    String fileName, {
    int? page,
    int? n,
    double? scale,
  }) {
    return _constructOperation($webpload, (op) {
      op.setString($filename, fileName);
      if (page != null) {
        op.setInt($page, page);
      }
      if (n != null) {
        op.setInt($n, n);
      }
      if (scale != null) {
        op.setDouble($scale, scale);
      }
    });
  }

  factory Image.fromWebPData(
    Uint8List data, {
    int? page,
    int? n,
    double? scale,
  }) {
    return _constructOperation($webploadBuffer, (op) {
      op.setBlob($buffer, Blob.from(data));
      if (page != null) {
        op.setInt($page, page);
      }
      if (n != null) {
        op.setInt($n, n);
      }
      if (scale != null) {
        op.setDouble($scale, scale);
      }
    });
  }

  factory Image.eye({
    required int width,
    required int height,
    double? factor,
    bool? uchar,
  }) {
    return _constructOperation($eye, (op) {
      op.setInt($width, width);
      op.setInt($height, height);
      if (factor != null) {
        op.setDouble($factor, factor);
      }
      if (uchar != null) {
        op.setBool($uchar, uchar);
      }
    });
  }

  factory Image.black() {
    throw UnimplementedError('TODO');
  }

  Image._(Pointer<VipsImage> pointer) : _image = GlibObject(pointer);

  final GlibObject<VipsImage> _image;

  int get sizeofHeader => _image.getUint64($sizeofHeader);

  int get bands => _image.getInt($bands);

  int get width => _image.getInt($width);

  int get height => _image.getInt($height);

  double get xResolution => _image.getDouble($xres);

  double get yResolution => _image.getDouble($yres);

  int get xOffset => _image.getInt($xoffset);

  int get yOffset => _image.getInt($yoffset);

  BandFormat get format =>
      _image.getDartEnum($format, BandFormat._cEnumMapping);

  Interpretation get interpretation =>
      _image.getDartEnum($interpretation, Interpretation._cEnumMapping);

  Coding get coding => _image.getDartEnum($coding, Coding._cEnumMapping);

  DemandStyle get demand =>
      _image.getDartEnum($demand, DemandStyle._cEnumMapping);

  String? get filename => _image.getString($filename);

  List<String> get fields {
    final fields = <String>[];
    final fieldsArray = vips_image_get_fields(_image.pointer);
    for (var i = 0; fieldsArray[i] != nullptr; i++) {
      fields.add(fieldsArray[i].cast<Utf8>().toDartString());
    }
    g_strfreev(fieldsArray);
    return fields;
  }

  Image invert() {
    throw UnimplementedError('TODO');
  }

  Image extractArea({
    int top = 0,
    int left = 0,
    required int width,
    required int height,
  }) {
    // This operation is the only one that doesn't use the $in argument, so we
    // cannot use the _transformOperation helper.
    return _constructOperation($extractArea, (op) {
      op
        ..setImage($input, this)
        ..setInt($top, top)
        ..setInt($left, left)
        ..setInt($width, width)
        ..setInt($height, height);
    });
  }

  Image crop({
    int left = 0,
    int top = 0,
    required int width,
    required int height,
  }) {
    return extractArea(
      left: left,
      top: top,
      width: width,
      height: height,
    );
  }

  Image flip(Direction direction) {
    return _transformOperation($flip, (op) {
      op.setDartEnum($direction, Direction._cEnumMapping, direction);
    });
  }

  Image join() {
    throw UnimplementedError('TODO');
  }

  Image conv() {
    throw UnimplementedError('TODO');
  }

  // TODO: temperature parameter
  Image labToXyz() {
    return _transformOperation($lab2xyz, (op) {});
  }

  Image yxyToXyz() {
    throw UnimplementedError('TODO');
  }

  Image xyzToLab() {
    throw UnimplementedError('TODO');
  }

  /// Looks at [interpretation] of this image and runs a set of colour space
  /// conversion functions to move it to [space].
  ///
  /// If [source] is set it is sued instead of this image's [interpretation].
  ///
  /// For example, given an image tagged as [Interpretation.xyz], calling
  /// this method with [space] set to [Interpretation.lab] will convert with
  /// [yxyToXyz] and [xyzToLab].
  ///
  /// See also:
  ///
  /// - [checkColourSpaceIsSupported] to check if this image is in a colour space
  ///   that [toColourSpace] can process.
  /// - [guessInterpretation] to guess a sane value for [interpretation] if the
  ///   set value looks crazy.
  // TODO: Reference more colour space conversion functions.
  Image toColourSpace(Interpretation space, {Interpretation? source}) {
    return _transformOperation($colourspace, (op) {
      op.setDartEnum($space, Interpretation._cEnumMapping, space);
      if (source != null) {
        op.setDartEnum($sourceSpace, Interpretation._cEnumMapping, source);
      }
    });
  }

  /// Tests if this image is in a colour space that [toColourSpace] can process.
  bool checkColourSpaceIsSupported() =>
      vips_colourspace_issupported(_image.pointer) == 1;

  /// Guesses a sane value for [interpretation] if the set value looks crazy.
  Interpretation guessInterpretation() => Interpretation
      ._cEnumMapping[vips_image_guess_interpretation(_image.pointer)]!;

  // TODO: Parameters
  void saveToWebPFile(String fileName) {
    _operation($webpsave, (op) {
      op.setString($filename, fileName);
    });
  }

  // TODO: Parameters
  Uint8List toWebPData() {
    return _operation(
      $webpsaveBuffer,
      (op) {},
      (result) => result.getBlob($buffer)!.asTypedList(),
    );
  }

  static Image _constructOperation(
    NativeString name,
    void Function(GlibObject op) setArguments,
  ) {
    final op = Operation(name);
    setArguments(op);
    return op.build((result) => result.getImage($out))!;
  }

  Image _transformOperation(
    NativeString name,
    void Function(GlibObject op) setArguments,
  ) {
    return _constructOperation(name, (op) {
      op.setImage($in, this);
      setArguments(op);
    });
  }

  T _operation<T>(
    NativeString name,
    void Function(GlibObject op) setArguments, [
    T Function(GlibObject result)? getResult,
  ]) {
    final op = Operation(name);
    op.setImage($in, this);
    setArguments(op);
    return op.build(getResult);
  }
}

extension GlibObjectImageAccessors on GlibObject {
  Image? getImage(NativeString name) {
    final image = getObject(name, vips_image_get_type());
    if (image == null) {
      return null;
    }
    g_object_ref(image);
    return Image._(image.cast());
  }

  void setImage(NativeString name, Image? image) =>
      setObject(name, vips_image_get_type(), image?._image.pointer.cast());
}
