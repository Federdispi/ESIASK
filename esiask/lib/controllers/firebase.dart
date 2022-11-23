import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';

import '../pages/auth/complete.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('Users');

Future<void> userSetup(String username, String specialite, String yearvalue,
    String subject, File imgFile) async {
  //for User informations storage

  String uid = auth.currentUser!.uid.toString();
  String email = auth.currentUser!.email.toString();

//for image storage
  String fileName = uid;
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child('Users_Icons/$fileName' '.png');
  UploadTask uploadTask = ref.putFile(imgFile);
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });

  users.add({
    'username': username,
    'specialite': specialite,
    'yearvalue': yearvalue,
    'subject': subject,
    'uid': uid,
    'email': email,
    'register_type': "address+password",
  });
  return;
}

Future<void> signupGOOGLE(BuildContext context, String username,
    String specialite, String yearvalue, String subject, File imgFile) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    String? photo = "";
    String? Username_ = "";

    if (imgFile == null) {
      photo = user?.photoURL;
    }

    if (username == "" || username == null) {
      Username_ = user?.displayName;
    } else {
      Username_ = username;
    }

    if (result != null) {
      users.add({
        'uid': user?.uid,
        'email': user?.email,
        'photoURL': photo,
        'username': Username_,
        'specialite': specialite,
        'yearvalue': yearvalue,
        'subject': subject,
        'register_type': "google"
      });
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}
