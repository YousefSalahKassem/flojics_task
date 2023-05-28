class ProfileResponse {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;

  ProfileResponse({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
    );
  }

  factory ProfileResponse.empty() {
    return ProfileResponse(
      id: 0,
      email: '',
      username: '',
      password: '',
      name: Name.empty(),
      address: Address.empty(),
      phone: '',
    );
  }
}

class Name {
  final String firstname;
  final String lastname;

  Name({required this.firstname, required this.lastname});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
    );
  }

  factory Name.empty() {
    return Name(
      firstname: '',
      lastname: '',
    );
  }
}

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String,
      street: json['street'] as String,
      number: json['number'] as int,
      zipcode: json['zipcode'] as String,
      geolocation:
          Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
    );
  }

  factory Address.empty() {
    return Address(
      city: '',
      street: '',
      number: 0,
      zipcode: '',
      geolocation: Geolocation.empty(),
    );
  }
}

class Geolocation {
  final String lat;
  final String long;

  Geolocation({required this.lat, required this.long});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'] as String,
      long: json['long'] as String,
    );
  }

  factory Geolocation.empty() {
    return Geolocation(lat: '', long: '');
  }
}
