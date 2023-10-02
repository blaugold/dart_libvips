import 'dart:io';

import 'package:dart_libvips/dart_libvips.dart';
import 'package:dart_libvips/src/image.dart';
import 'package:test/test.dart';

void main() {
  setUp(initVips);

  test('create empty image', () {
    final image = Image();
    expect(image.bands, 1);
    expect(image.width, 1);
    expect(image.height, 1);
  });

  test('load webp image', () {
    final image = Image.fromWebPFile('test/fixtures/image/one.webp');
    expect(image.bands, 3);
    expect(image.width, 550);
    expect(image.height, 368);
  });

  test('eye', () {
    final eye = Image.eye(width: 300, height: 300, uchar: true, factor: .01);
    final outUri = testTempDir.resolve('eye.webp');
    eye.saveToWebPFile(outUri.toFilePath());
    expect(File.fromUri(outUri).existsSync(), isTrue);
  });

  test('flip', () {
    final eye = Image.fromWebPFile('test/fixtures/image/one.webp');
    final outUri = testTempDir.resolve('flip.webp');
    eye.flip(Direction.horizontal).saveToWebPFile(outUri.toFilePath());
    expect(File.fromUri(outUri).existsSync(), isTrue);
  });
}

bool get deleteTestTempDir => _deleteTestTempDir ?? true;

set deleteTestTempDir(bool value) {
  _deleteTestTempDir = value;
  addTearDown(() => _deleteTestTempDir = null);
}

bool? _deleteTestTempDir;

Uri get testTempDir {
  if (_testTempDir == null) {
    final tempDir = Directory.systemTemp.createTempSync();
    _testTempDir = tempDir.uri;
    if (deleteTestTempDir) {
      addTearDown(() {
        tempDir.deleteSync(recursive: true);
        _testTempDir = null;
      });
    } else {
      print('Test temp dir: ${_testTempDir!.toFilePath()}');
    }
  }
  return _testTempDir!;
}

Uri? _testTempDir;
