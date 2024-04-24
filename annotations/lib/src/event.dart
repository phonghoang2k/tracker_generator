class TrackerEventData {
  final String screenName;
  final Map<String, dynamic> extraData;
  final String? referrer;
  final String? contentType;

  TrackerEventData({
    required this.screenName,
    this.extraData = const {},
    this.referrer,
    this.contentType,
  });

  @override
  int get hashCode =>
      screenName.hashCode ^ extraData.hashCode ^ referrer.hashCode ^ contentType.hashCode;

  @override
  bool operator ==(Object other) =>
      other is TrackerEventData &&
      other.screenName == screenName &&
      other.extraData == extraData &&
      other.referrer == referrer &&
      other.contentType == contentType;

  @override
  String toString() =>
      'TrackerEventData{screenName: $screenName, extraData: $extraData, referrer: $referrer, contentType: $contentType}';
}
