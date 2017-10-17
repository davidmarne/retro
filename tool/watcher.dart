import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:built_redux/generator.dart';

/// Start a watcher that automatically builds the generated files in the
/// built_value chat example on changes.
Future main(List<String> args) async {
  watch([
    new BuildAction(
        new PartBuilder([
          new BuiltValueGenerator(),
          new BuiltReduxGenerator(),
        ]),
        'retro',
        inputs: const ['lib/**/*.dart'])
  ], deleteFilesByDefault: true);
}
