// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kunlik/service/firebase/firebase.dart';
import 'package:kunlik/view/auth/view/auth_view.dart';

class AdminPage extends StatelessWidget {
  final String email;
  const AdminPage({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(email),
            TextButton(
              child: const Text('Sign Out'),
              onPressed: () {
                signOut(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Admin'),
      ),
    );
  }

  Future signOut(BuildContext context) async {
    await FireService.auth.signOut();
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
