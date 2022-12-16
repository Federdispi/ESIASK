import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Add'),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: const Center(
        child: Text('Add'),
      ),
    );
  }
}
