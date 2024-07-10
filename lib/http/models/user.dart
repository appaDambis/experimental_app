import 'package:experimental_app/http/models/dob.dart';
import 'package:experimental_app/http/models/imageurl.dart';
import 'package:experimental_app/http/models/location.dart';
import 'package:experimental_app/http/models/user_name.dart';

class User {
  final String email;
  final String gender;
  final String phone;
  final String cell;
  final String nat;
  final Username name;
  final ImageUrl picture;
  final Location location;
  final Dob dob;
  User({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.picture,
    required this.location,
    required this.dob,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
