# Copywriter by Pinpos
# Kịch bản sử dụng

```dart
@trackable
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with _$SignInPageMixin {
}
```

————————————————————————————————————————————————————————————————————————————

```dart
@optionalTypeArgs
mixin _SignInPageMixin<T extends StatefulWidget> on State<T> {
  final className = "SignInPage";

  @protected
  void onEnter() {
    // EnterScreenViewData(to: className).analytics();
  }

  @protected
  void onExit() {
    // ExitScreenViewData(from: className).analytics();
  }

  @override
  void initState() {
    onEnter();
    log("Load TrackablePage: $className", name: 'TRACKER_FLUTTER');
    super.initState();
  }

  @override
  void dispose() {
    onExit();
    log("Unload TrackablePage: $className", name: 'TRACKER_FLUTTER');
    super.dispose();
  }
}
```

- Với App Pinpos, dùng annotation `@trackablePinpos`, `@Trackable.pinpos()` để track screen view với EnterScreenViewData và ExitScreenViewData
- Với các app khác, dùng annotation `@trackable`, `@Trackable()` để track screen view.

```dart
class Trackable {
  final String? contentType;
  final String? referrer;
  final TrackingTenant tenant;

  const Trackable({this.contentType, this.referrer, this.tenant = TrackingTenant.other});
}

```


- Mixin `_$SignInPageMixin` được sinh ra từ file `tracker_flutter_generator.dart`, có thể `@override` các hàm `onEnter` và `onExit` để custom track các event khác nhau.

```dart
class _SignInPageState extends State<SignInPage> with _$SignInPageMixin {
  @override
  void onEnter() {
    // Do something
    super.onEnter();
  }

  @override
  void onExit() {
    // Do something
    super.onExit();
  }

  ......
}
```


