// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_page.dart';

// **************************************************************************
// TrackerGenerator
// **************************************************************************

@optionalTypeArgs
mixin _$SignInPageMixin on State<SignInPage> {
  final className = "SignInPageQWe";
  final contentType = null;
  final referrer = "asdasdas";
  Map<String, dynamic> get params => {
        "name": _tryToJson(widget.name),
        "version": _tryToJson(widget.version),
        "properties": _tryToJson(widget.properties),
        "_b": _tryToJson(widget._b),
      };

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
dynamic _tryToJson(dynamic value) {
  try {
    return value.toJson();
  } catch (e) {
    return value;
  }
}
