import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;
  String subject;
  String speciality;
  String year;
  bool admin;

  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
    required this.subject,
    required this.speciality,
    required this.year,
    this.admin = false,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'profilePhoto': profilePhoto,
        'email': email,
        'uid': uid,
        'subject': subject,
        'speciality': speciality,
        'year': year,
        'admin': false
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      name: snapshot['name'],
      profilePhoto: snapshot['profilePhoto'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      subject: snapshot['subject'],
      speciality: snapshot['speciality'],
      year: snapshot['year'],
      admin: snapshot['admin'],
    );
  }
}
