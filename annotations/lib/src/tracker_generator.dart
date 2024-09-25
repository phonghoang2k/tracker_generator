import 'package:tracker_annotations/src/event.dart';

import 'observer.dart';

class Trackable {
  const Trackable({
    this.contentType,
    this.referrer,
    this.screenName,
  });

  final String? contentType;
  final String? referrer;
  final String? screenName;

  static TrackerObserver observer = const _DefaultTrackerObserver();
}

const trackable = Trackable();

class _DefaultTrackerObserver extends TrackerObserver {
  const _DefaultTrackerObserver();

  @override
  void onEnter(TrackerEventData event) {}

  @override
  void onExit(TrackerEventData event) {}
}
