import 'package:cloud_firestore/cloud_firestore.dart';

class Questions{

  String title;
  String description;
  String taggedfiliere;

  Questions({
    required this.title,
    required this.description,
    required this.taggedfiliere
  });

  Map<String,dynamic> toJson()=>{
    'title':title,
    'description':description,
    'taggedfiliere':taggedfiliere
  };

  static Questions fromSnap(DocumentSnapshot snap){
     var snapshot = snap.data() as Map<String, dynamic>;

     return Questions(
      
      title: snapshot['title'],
      description: snapshot['description'],
      taggedfiliere: snapshot['taggedfiliere']
      
      );
  }


}