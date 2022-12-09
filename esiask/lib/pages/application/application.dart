import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esiask/const.dart';
import 'package:esiask/pages/application/feed.dart';
import 'package:esiask/pages/application/home.dart';
import 'package:esiask/pages/application/mod.dart';
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

  final pagesAdmin = <Widget>[
    const Home(),
    const Search(),
    const Feed(),
    const Profile(),
    const Mod(),
  ];

  int currentIndex = 0;
  bool admin = false;

  @override
  void initState() {
    super.initState();
    checkIfDocumentExists();
    isAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: admin ? pagesAdmin : pages,
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
            icon: Icon(currentIndex != 0 ? Icons.home_outlined : Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(currentIndex != 1 ? Icons.search_outlined : Icons.search),
            label: 'Chercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex != 2 ? Icons.favorite_border : Icons.favorite),
            label: 'Suivis',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex != 3 ? Icons.person_outline : Icons.person),
            label: 'Profil',
          ),
          if (admin)
            BottomNavigationBarItem(
              icon: Icon(
                  currentIndex != 4 ? Icons.feedback_outlined : Icons.feedback),
              label: 'Modération',
            )
        ],
      ),
    );
  }

  void checkIfDocumentExists() async {
    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection('Users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    if (!mounted) {
      return;
    }

    if (!documentSnapshot.exists) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Complete()));
    }
  }

  void isAdmin() async {
    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection('Users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    final Map<String, dynamic> doc =
        documentSnapshot.data() as Map<String, dynamic>;
    setState(() {
      admin = doc['admin'];
    });
  }
}
