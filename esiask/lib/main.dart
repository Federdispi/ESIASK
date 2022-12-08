import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esiask/const.dart';
import 'package:esiask/pages/application/application.dart';
import 'package:esiask/pages/auth/complete.dart';
import 'package:esiask/pages/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Application();
          } else {
            return const LogIn();
          }
        },
      ),
    );
  }
}
