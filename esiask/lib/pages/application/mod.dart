import 'package:flutter/material.dart';

class Mod extends StatelessWidget {
  const Mod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Mod'),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: const Center(
        child: Text('Mod'),
      ),
    );
  }
}
