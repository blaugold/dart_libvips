import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  final buildConfig = await BuildConfig.fromArgs(args);
  final buildOutput = BuildOutput();

  final builder = MesonBuilder.library(
    assetId: 'package:dart_libvips/src/bindings.dart',
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

  await builder.run(
    buildConfig: buildConfig,
    buildOutput: buildOutput,
    logger: Logger('')
      ..level = Level.ALL
      ..onRecord.listen((record) => print(record.message)),
  );

  await buildOutput.writeToFile(outDir: buildConfig.outDir);
}
