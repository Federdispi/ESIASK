import 'package:esiask/const.dart';
import 'package:esiask/pages/application/feed.dart';
import 'package:esiask/pages/application/home.dart';
import 'package:esiask/pages/application/profile.dart';
import 'package:esiask/pages/application/search.dart';
import 'package:esiask/pages/auth/complete.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final pages = <Widget>[
    const Home(),
    const Search(),
    const Feed(),
    const Profile(),
  ];

  int currentIndex = 0;
  bool documentExists = false;

  @override
  void initState() {
    super.initState();
    checkIfDocumentExists(documentExists);
  }

  @override
  Widget build(BuildContext context) {
    return documentExists
        ? Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).backgroundColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: (value) => setState(() {
                currentIndex = value;
              }),
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex != 0 ? Icons.home_outlined : Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex != 1 ? Icons.search_outlined : Icons.search),
                  label: 'Chercher',
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex != 2
                      ? Icons.favorite_border
                      : Icons.favorite),
                  label: 'Suivis',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex != 3 ? Icons.person_outline : Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          )
        : const Complete();
  }
}

void checkIfDocumentExists(bool documentExists) {
  firebaseFirestore
      .collection('Users')
      .doc(firebaseAuth.currentUser!.uid)
      .get()
      .then((value) => documentExists = value.exists ? true : false);
}
