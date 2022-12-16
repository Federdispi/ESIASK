import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:esiask/models/user.dart' as model;

final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;
final firebaseFirestore = FirebaseFirestore.instance;
final googleSignIn = GoogleSignIn();
model.User currentUser = model.User(
  name: "",
  profilePhoto: "",
  email: "",
  uid: "",
  subject: "",
  speciality: "",
  year: "",
);
