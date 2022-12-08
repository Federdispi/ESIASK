import 'dart:io';

import 'package:esiask/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esiask/models/user.dart' as model;
import 'package:firebase_storage/firebase_storage.dart';

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
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
