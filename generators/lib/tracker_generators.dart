library tracker_generators;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/tracker_generator.dart';

Builder trackable(BuilderOptions options) => PartBuilder(
      [
        TrackerGenerator(),
      ],
      ".trackable.dart",
      options: options,
    );
