typedef TrackerFlutterGlobalEvent = void Function(
  String screenName, {
  Map<String, dynamic> extraData,
  String? referrer,
  String? contentType,
});

class TrackerFlutterGlobal {
  TrackerFlutterGlobal._();

  static final TrackerFlutterGlobal _instance = TrackerFlutterGlobal._();

  factory TrackerFlutterGlobal() => _instance;

  TrackerFlutterGlobalEvent? onEnter;

  TrackerFlutterGlobalEvent? onExit;
}
