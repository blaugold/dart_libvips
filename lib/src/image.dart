import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'bindings.dart';
import 'glib.dart';
import 'native_string.dart';
import 'operation.dart';

enum BandFormat {
  notset,
  uchar,
  char,
  ushort,
  short,
  uint,
  int,
  float,
  complex,
  double,
  dpcomplex;

  static const _cEnumMapping = {
    VipsBandFormat.VIPS_FORMAT_NOTSET: BandFormat.notset,
    VipsBandFormat.VIPS_FORMAT_UCHAR: BandFormat.uchar,
    VipsBandFormat.VIPS_FORMAT_CHAR: BandFormat.char,
    VipsBandFormat.VIPS_FORMAT_USHORT: BandFormat.ushort,
    VipsBandFormat.VIPS_FORMAT_SHORT: BandFormat.short,
    VipsBandFormat.VIPS_FORMAT_UINT: BandFormat.uint,
    VipsBandFormat.VIPS_FORMAT_INT: BandFormat.int,
    VipsBandFormat.VIPS_FORMAT_FLOAT: BandFormat.float,
    VipsBandFormat.VIPS_FORMAT_COMPLEX: BandFormat.complex,
    VipsBandFormat.VIPS_FORMAT_DOUBLE: BandFormat.double,
    VipsBandFormat.VIPS_FORMAT_DPCOMPLEX: BandFormat.dpcomplex,
  };
}

enum Interpretation {
  error,
  multiBand,
  bw,
  histogram,
  xyz,
  lab,
  cmyk,
  labq,
  rgb,
  cmc,
  lch,
  labs,
  srgb,
  yxy,
  fourier,
  rgb16,
  grey16,
  matrix,
  scrgb,
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

enum Coding {
  error,
  none,
  labq,
  rad;

  static const _cEnumMapping = {
    VipsCoding.VIPS_CODING_ERROR: Coding.error,
    VipsCoding.VIPS_CODING_NONE: Coding.none,
    VipsCoding.VIPS_CODING_LABQ: Coding.labq,
    VipsCoding.VIPS_CODING_RAD: Coding.rad,
  };
}

enum DemandStyle {
  error,
  smallTile,
  fatStrip,
  thinStrip,
  any;

  static const _cEnumMapping = {
    VipsDemandStyle.VIPS_DEMAND_STYLE_ERROR: DemandStyle.error,
    VipsDemandStyle.VIPS_DEMAND_STYLE_SMALLTILE: DemandStyle.smallTile,
    VipsDemandStyle.VIPS_DEMAND_STYLE_FATSTRIP: DemandStyle.fatStrip,
    VipsDemandStyle.VIPS_DEMAND_STYLE_THINSTRIP: DemandStyle.thinStrip,
    VipsDemandStyle.VIPS_DEMAND_STYLE_ANY: DemandStyle.any,
  };
}

enum Direction {
  horizontal,
  vertical;

  static const _cEnumMapping = {
    VipsDirection.VIPS_DIRECTION_HORIZONTAL: Direction.horizontal,
    VipsDirection.VIPS_DIRECTION_VERTICAL: Direction.vertical,
  };
}

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

  Image extractArea({
    int top = 0,
    int left = 0,
    required int width,
    required int height,
  }) {
    // This operation is the only one that doesn't use the $in argument, so we
    // cannot use the _transformOperation helper.
    return _constructOperation($extract_area, (op) {
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

  void saveToWebPFile(String fileName) {
    _effectOperation($webpsave, (op) {
      op.setString($filename, fileName);
    });
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

  void _effectOperation(
    NativeString name,
    void Function(GlibObject op) setArguments,
  ) {
    final op = Operation(name);
    op.setImage($in, this);
    setArguments(op);
    return op.build();
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
