import 'package:esiask/pages/application/application.dart';
import 'package:esiask/pages/auth/complete.dart';
import 'package:esiask/pages/auth/login.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const Application(),
    );
  }
}
