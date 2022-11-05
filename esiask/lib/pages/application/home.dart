import 'package:esiask/models/logo.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Logo(fontSize: 24),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
