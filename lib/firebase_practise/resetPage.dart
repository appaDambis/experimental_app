import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Resetpage extends StatefulWidget {
  const Resetpage({super.key});

  @override
  State<Resetpage> createState() => _ResetpageState();
}

class _ResetpageState extends State<Resetpage> {
  TextEditingController _reset = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _reset,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: resetEmail, child: const Text("Send"))
          ],
        ),
      ),
    );
  }

  Future<void> resetEmail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: _reset.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Nahi hou shakat")));
    }
  }
}
