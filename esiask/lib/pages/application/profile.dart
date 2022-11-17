import 'package:esiask/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => signOut(), child: const Text("LogOut")),
      ),
    );
  }
}
