import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';



Future<void> userSetup(String username,String specialite,String yearvalue,String subject,File imgFile) async{
   
  
  
  
  //for User informations storage
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString(); 
  String email = auth.currentUser!.email.toString();



//for image storage
String fileName = uid;
FirebaseStorage storage = FirebaseStorage.instance;
Reference ref = storage.ref().child('Users_Icons/$fileName' '.png');
UploadTask uploadTask = ref.putFile(imgFile!);
uploadTask.then((res) {
   res.ref.getDownloadURL();
});



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