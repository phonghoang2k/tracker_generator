class TrackerCommand {
  TrackerCommand._();

  static const pinposCommandEnter = 'EnterScreenViewData(to: className).analytics();';
  static const pinposCommandExit = 'ExitScreenViewData(from: className).analytics();';

  static const tryToJson = '''
    dynamic _tryToJson(dynamic value) {
    try {
      return value.toJson();
    } catch (e) {
      return value;
    }
  }
  ''';
}
