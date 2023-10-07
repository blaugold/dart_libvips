import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

final logger = Logger('')
  ..level = Level.ALL
  ..onRecord.listen((record) => print(record.message));

void main(List<String> args) async {
  final buildConfig = await BuildConfig.fromArgs(args);
  final buildOutput = BuildOutput();

  final vipsBuilder = MesonBuilder.library(
    assetId: 'package:vips/src/bindings.dart',
    target: 'libvips/vips',
    project: 'vendor/libvips',
    options: {
      'bundle_deps': 'enabled',
      'auto_features': 'disabled',
      'webp': 'enabled',
      'deprecated': 'false',
      'examples': 'false',
      'cplusplus': 'false',
    },
    subprojects: [
      'expat.wrap',
      'glip.wrap',
      'libwebp.wrap',
      'pcre2.wrap',
      'proxy-libintl.wrap',
    ],
  );

  await vipsBuilder.run(
    buildConfig: buildConfig,
    buildOutput: buildOutput,
    logger: logger,
  );

  final supportBuilder = CBuilder.library(
    name: 'noop',
    assetId: 'package:vips/src/support_bindings.dart',
    sources: [
      'src/support.c',
    ],
  );

  await supportBuilder.run(
    buildConfig: buildConfig,
    buildOutput: buildOutput,
    logger: logger,
  );

  await buildOutput.writeToFile(outDir: buildConfig.outDir);
}
