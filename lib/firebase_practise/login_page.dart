import 'package:experimental_app/firebase_practise/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> onLogin() async {
    try {
      final String email = _emailEditingController.text.trim();
      final String password = _passwordEditingController.text;

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("created account");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Cant login")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page "),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              TextField(
                controller: _emailEditingController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordEditingController,
              ),
              ElevatedButton(onPressed: onLogin, child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text("Dont have account")),
            ],
          ),
        ),
      ),
    );
  }
}
