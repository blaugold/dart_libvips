/// A Dart API for the VIPS image processing library.
///
/// The get started, see the [Image] class. It is the central API of this
/// library.
///
/// Make sure the call [initVips] before using this library from any other
/// [Isolate] than the main one.
library;

import 'dart:isolate';

export 'src/exception.dart' show VipsException;
export 'src/image.dart'
    show Image, BandFormat, Interpretation, Coding, DemandStyle, Direction;
export 'src/init.dart' show initVips;
