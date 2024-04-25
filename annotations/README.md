# Copywriter by Pong Pong (phonghoang2k)

# How to use

## Install

To use [Trackable], you will need your typical [build_runner]/code-generator setup.\
First, install [build_runner] and [Trackable] by adding them to your `pubspec.yaml` file:

For a Flutter project:

```console
flutter pub add tracker_annotations
flutter pub add dev:build_runner
flutter pub add dev:tracker_generators
```

This installs three packages:

- [build_runner](https://pub.dev/packages/build_runner), the tool to run code-generators
- [tracker_generators], the code generator
- [tracker_annotations](https://pub.dev/packages/tracker_annotations), a package containing annotations for [tracker_generators].


## Run the generator

To run the code generator, execute the following command:

```
dart run build_runner build
```

Note that like most code-generators, [Trackable] will need you to both import the annotation ([tracker_annotations])
and use the `part` keyword on the top of your files.

As such, a file that wants to use [Trackable] will start with:

```dart
import 'package:tracker_annotations/tracker_annotations.dart';

part 'my_file.trackable.dart';

```

## Creating a Trackable Page using Trackable

An example is better than a long abstract explanation, so here's a typical Trackable class:

```dart

part 'sign_in_page.trackable.dart';

@trackable
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with _$SignInPageMixin {
}
```

- Using `@trackable` annotation to generate `part 'sign_in_page.trackable.dart';` file.
- `part 'sign_in_page.trackable.dart';` file is generated from `tracker_flutter_generator.dart`
  file, you can use it to track the screen.

```dart
class Trackable {
  final String? contentType;
  final String? referrer;

  const Trackable({this.contentType, this.referrer});
}

```

- Using `Trackable` class to track the screen.
- `Trackable` class has two properties: `contentType` and `referrer`.

```dart
void main() {
  runApp(const MyApp());

  Trackable.observer = const MyObserver();
}
```

- Set `Trackable.observer` to `MyObserver` class.

```dart
class MyObserver extends TrackableObserver {
  @override
  void onEnter(TrackerEventData event) {
    // Do something when enter the screen
  }

  @override
  void onExit(TrackerEventData event) {
    // Do something when exit the screen
  }
}
```

- Implement `TrackableObserver` class to observe the screen.
- Implement `onEnter` method to do something when enter the screen.
- Implement `onExit` method to do something when exit the screen.


