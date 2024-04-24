// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_page.dart';

// **************************************************************************
// TrackerGenerator
// **************************************************************************

@optionalTypeArgs
mixin _$SignUpPageMixin on State<SignUpPage> {
  final className = "SignUpPage";
  final contentType = null;
  final referrer = null;
  Map<String, dynamic> get params => {};

  TrackerEventData get eventData => TrackerEventData(
        screenName: className,
        referrer: referrer,
        contentType: contentType,
        extraData: params,
      );
  void _onEnter() {
    Trackable.observer.onEnter(eventData);
  }

  void _onExit() {
    Trackable.observer.onExit(eventData);
  }

  @override
  void initState() {
    _onEnter();
    log("Load TrackablePage: $className, params: $params",
        name: 'TRACKER_FLUTTER');
    super.initState();
  }

  @override
  void dispose() {
    _onExit();
    log("Unload TrackablePage: $className, params: $params",
        name: 'TRACKER_FLUTTER');
    super.dispose();
  }
}
