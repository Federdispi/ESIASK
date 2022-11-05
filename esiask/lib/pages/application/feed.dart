import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Feed'),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: const Center(
        child: Text('Feed'),
      ),
    );
  }
}
