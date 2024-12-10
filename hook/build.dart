import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';
import 'package:native_toolchain_meson/native_toolchain_meson.dart';

final logger = Logger('')
  ..level = Level.ALL
  ..onRecord.listen((record) => print(record.message));

void main(List<String> args) async {
  return build(args, (config, output) async {
    final vipsBuilder = MesonBuilder.library(
      assetName: 'src/bindings.dart',
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
      config: config,
      output: output,
      logger: logger,
    );

    final supportBuilder = CBuilder.library(
      name: 'noop',
      assetName: 'src/support_bindings.dart',
      sources: [
        'src/support.c',
      ],
    );

    await supportBuilder.run(
      config: config,
      output: output,
      logger: logger,
    );
  });
}
