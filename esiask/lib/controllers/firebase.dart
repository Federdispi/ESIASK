import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> userSetup(String username,String specialite,String yearvalue,String subject) async{
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString(); 
  String email = auth.currentUser!.email.toString();

  users.add({
    'username' : username,
    'specialite' : specialite,
    'yearvalue' : yearvalue,
    'subject' : subject,
    'uid' : uid,
    'email' : email,
    
  }
  );
  return;

}
