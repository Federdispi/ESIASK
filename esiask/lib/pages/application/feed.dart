import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Pourquoi les mouches?',
      'Comment on fait?',
      'Où peut on?'
    ];
    final List<int> colorCodes = <int>[600, 500, 700];

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text('Feed'),
          elevation: 1,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            //changer return Container par les questions suivies
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
