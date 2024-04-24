import 'package:meta/meta.dart';

import 'event.dart';

/// {@template observer}
/// An interface for observing the behavior of [Trackable] instances.
/// {@endtemplate}
abstract class TrackerObserver {
  const TrackerObserver();

  /// Called whenever a page is entered.
  @mustCallSuper
  void onEnter(TrackerEventData event);

  /// Called whenever a page is exited.
  @mustCallSuper
  void onExit(TrackerEventData event);
}
