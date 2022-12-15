import 'dart:io';

import 'package:esiask/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esiask/models/user.dart' as model;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

void registerWithEmailAndPassword(String email, String password) async {
  try {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

void addUserToDatabase(String name, File? profilePhoto, String subject,
    String speciality, String year) async {
  String downloadUrl = '';
  if (profilePhoto != null) {
    downloadUrl = await _uploadProfilePhotoToStorage(profilePhoto);
  }

  model.User user = model.User(
    name: name,
    profilePhoto: downloadUrl,
    email: firebaseAuth.currentUser!.email!,
    uid: firebaseAuth.currentUser!.uid,
    subject: subject,
    speciality: speciality,
    year: year,
  );

  await firebaseFirestore
      .collection('Users')
      .doc(firebaseAuth.currentUser!.uid)
      .set(user.toJson());
}

Future<String> _uploadProfilePhotoToStorage(File profilePhoto) async {
  Reference ref = firebaseStorage
      .ref()
      .child('profilePhotos')
      .child(firebaseAuth.currentUser!.uid);
  UploadTask uploadTask = ref.putFile(profilePhoto);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

void signOut() async {
  await FirebaseAuth.instance.signOut();
}

void sendEmailVerification() async {
  try {
    final user = firebaseAuth.currentUser!;
    await user.sendEmailVerification();
  } catch (e) {
    print(e);
    // TODO
  }
}

Future<void> resetPassword(String email) async {
  try {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

Future googleLogin() async {
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return;

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  try {
    await firebaseAuth.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

Future facebookLogin() async{
   // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
   try {
    await
  FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
   }
   on FirebaseAuthException catch (e) {
    print(e);
  }
}
