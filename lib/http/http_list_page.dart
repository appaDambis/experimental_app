import 'dart:convert';

import 'package:experimental_app/http/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpListPage extends StatefulWidget {
  const HttpListPage({super.key});

  @override
  State<HttpListPage> createState() => _HttpListPageState();
}

class _HttpListPageState extends State<HttpListPage> {
  List<User1> users = [];
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of fetched users"),
        backgroundColor: Colors.purple,
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(user.email),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // void fetchUsers() async {
  //   print("Fetche users called");
  //   var url = "https://randomuser.me/api/?results=100";
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e) {
  //     final name = Username(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last']);
  //     final picture = ImageUrl(
  //         large: e['picture']['large'],
  //         medium: e['picture']['medium'],
  //         thumbnail: e['picture']['thumbnail']);
  //     final street = LocationStreet(
  //         name: e['location']['street']['name'],
  //         number: e['location']['street']['number']);
  //     final coordinates = LocationCoordinates(
  //         longitude: e['location']['coordinates']['longitude'],
  //         latitude: e['location']['coordinates']['latitude']);
  //     final timezone = LocationTimezone(
  //         offset: e['location']['timezone']['offset'],
  //         description: e['location']['timezone']['description']);
  //     final location = Location(
  //       street: street,
  //       city: e['location']['city'],
  //       state: e['location']['state'],
  //       country: e['location']['country'],
  //       postcode: e['location']['postcode'].toString(),
  //       coordinates: coordinates,
  //       timezone: timezone,
  //     );
  //     final date = e['dob']['date'];
  //     final dob = Dob(
  //       date: DateTime.parse(date),
  //       age: e['dob']['age'].toString(),
  //     );
  //     return User(
  //         email: e['email'],
  //         gender: e['gender'],
  //         phone: e['phone'],
  //         cell: e['cell'],
  //         nat: e['nat'],
  //         name: name,
  //         picture: picture,
  //         location: location,
  //         dob: dob);
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //     isLoaded = true;
  //   });
  // }

  void fetchUser() async {
    var url = "https://randomuser.me/api/?results=100";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return User1(email: e['email']);
    }).toList();
    setState(() {
      users = transformed;
      isLoaded = true;
    });
  }
}


