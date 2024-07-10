import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  void initState() {
    super.initState();
    print("initState called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies called");
  }

  @override
  void didUpdateWidget(MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget called");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate called");
  }

  @override
  void dispose() {
    print("dispose called");
    super.dispose();
  }

  void main() async {
    try {
      String userData = await fetchUserData();
      print('User: $userData');
    } catch (error) {
      print("Error is $error");
    }

    Stream<String> updateStream = fetchUserStream();

    updateStream.listen((update) {
      print("Recieved update: $update");
    }, onError: (error) {
      print("Error is $error");
    }, onDone: () {
      print("Done bochya");
    });
  }

  Future<String> fetchUserData() async {
    await Future.delayed(Duration(seconds: 1));
    return "User : 20001";
  }

  Stream<String> fetchUserStream() async* {
    await Future.delayed(Duration(seconds: 1));
    for (int i = 1; i < 6; i++) {
      yield "user : $i";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widget Lifecycle")),
      body: Center(
        child: ElevatedButton(
          onPressed: main,
          child: Text("Press me"),
        ),
      ),
    );
  }

  void _updateState() {
    setState(() {
      print("setState called");
    });
  }
}
