import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esiask/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';

import '../pages/auth/complete.dart';


CollectionReference users = FirebaseFirestore.instance.collection('Users');

userSetup(String username, String specialite, String yearvalue,
    String subject, File imgFile,String password) async {
  //for User informations storage
final FirebaseAuth auth = FirebaseAuth.instance;
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

  

  return  signInWithEmailAndPassword(email, password);
}


loginGOOGLE(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

        // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(authCredential);
  }}

signupGOOGLE(BuildContext context, String username,
    String specialite, String yearvalue, String subject, File imgFile) async {


      print("1");


  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    print("2");
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        print("3");
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
final FirebaseAuth auth = FirebaseAuth.instance;
    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    print("4");

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


    //for image storage
  String? fileName = user?.uid;
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child('Users_Icons/$fileName' '.png');
  UploadTask uploadTask = ref.putFile(imgFile);
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });

print("5");
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
    }

    print("6"); 
  }
}

String? downloadURL;

getData(String uid) async{
// Create a storage reference from our app
final storageRef = FirebaseStorage.instance.ref();

// Create a reference with an initial file path and name
final pathReference = storageRef.child("User_Icons").child('$uid.png');

var imgURL = await pathReference.getDownloadURL();

return imgURL;

}
