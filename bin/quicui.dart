#!/usr/bin/env dart

import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:quicui_cli/quicui_cli.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner('quicui', 'QuicUI Code Push CLI')
    // New streamlined commands (recommended)
    ..addCommand(InitCommand())
    ..addCommand(ReleaseCommand())
    ..addCommand(PatchCommand())
    ..addCommand(EngineCommand())
    // Legacy commands (still available)
    ..addCommand(BuildApkCommand())
    ..addCommand(BuildIpaCommand())
    ..addCommand(GeneratePatchCommand())
    ..addCommand(UploadBaselineCommand())
    ..addCommand(UploadPatchCommand());

  try {
    await runner.run(arguments);
  } catch (e) {
    print('❌ Error: $e');
    exit(1);
  }
}
