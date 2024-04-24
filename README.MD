# Copywriter by Pong Pong (phonghoang2k)

# How to use

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


