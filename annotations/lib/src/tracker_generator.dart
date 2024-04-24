enum TrackingTenant { pinpos, other }

class Trackable {
  const Trackable({
    this.contentType,
    this.referrer,
    this.tenant = TrackingTenant.other,
  });

  const Trackable.pinpos({
    this.contentType,
    this.referrer,
  }) : tenant = TrackingTenant.pinpos;

  final String? contentType;
  final String? referrer;
  final TrackingTenant tenant;
}

const trackable = Trackable();

const trackablePinpos = Trackable.pinpos();
