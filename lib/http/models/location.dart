class Location {
  final LocationStreet street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.name, required this.number});
}

class LocationCoordinates {
  final String longitude;
  final String latitude;

  LocationCoordinates({required this.longitude, required this.latitude});
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});
}
