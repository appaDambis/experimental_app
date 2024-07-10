// import 'dart:convert';

// import 'package:experimental_app/http/user.dart';
// import 'package:http/http.dart' as http;

// class UserApi {
//   static Future<List<User>> fetchUsers() async {
//     print("Fetch users called");
//     var url = "https://randomuser.me/api/?results=100";
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;
//     final users = results.map((e) {
//       final name = Username(
//           title: e['name']['title'],
//           first: e['name']['first'],
//           last: e['name']['last']);
//       final picture = ImageUrl(
//           large: e['picture']['large'],
//           medium: e['picture']['medium'],
//           thumbnail: e['picture']['thumbnail']);
//       return User(
//           email: e['email'],
//           gender: e['gender'],
//           phone: e['phone'],
//           cell: e['cell'],
//           nat: e['nat'],
//           name: name,
//           picture: picture);
//     }).toList();
//     return users;
//   }
// }
