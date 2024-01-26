class Country {
  final String name;
  final String timezone;

  Country({required this.name, required this.timezone});

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'],
      timezone: map['timezones'],
    );
  }}