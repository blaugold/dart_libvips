import 'package:native_assets_cli/native_assets_cli.dart';

void main(List<String> args) async {
  final buildConfig = await BuildConfig.fromArgs(args);
  final buildOutput = BuildOutput();


  await buildOutput.writeToFile(outDir: buildConfig.outDir);
}
