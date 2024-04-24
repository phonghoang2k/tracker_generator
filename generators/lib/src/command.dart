class TrackerCommand {
  TrackerCommand._();

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
