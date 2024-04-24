// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_page.dart';

// **************************************************************************
// TrackerGenerator
// **************************************************************************

@optionalTypeArgs
mixin _$SignInPageMixin on State<SignInPage> {
  final className = "SignInPage";
  final contentType = null;
  final referrer = null;
  Map<String, dynamic> get params => {
        "name": _tryToJson(widget.name),
        "version": _tryToJson(widget.version),
        "properties": _tryToJson(widget.properties),
        "_b": _tryToJson(widget._b),
      };

  @protected
  void onEnter(String className) {}
  @protected
  void onExit(String className) {}

  @override
  void initState() {
    onEnter(className);
    log("Load TrackablePage: $className, params: $params",
        name: 'TRACKER_FLUTTER');
    super.initState();
  }

  @override
  void dispose() {
    onExit(className);
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
