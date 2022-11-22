import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../controllers/firebase.dart';
import '../application/application.dart';

enum ImageSourceType { gallery, camera }

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
   File? imageFile;
 final ImagePicker _picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();

  final subjects = <String>["GEIPI", "IT", "MDD", "Robotique"];
  String subjectValue = "GEIPI";


 

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;


  final years = <String>[
    "1ère année",
    "2ème année",
    "3ème année",
    "4ème année",
    "5ème année",
    "OG"
  ];
  String yearValue = "1ère année";

  final specialities = <String, List>{
    "GEIPI": ["Aucune"],
    "IT": ["Aucune", "ILC", "SE", "SQR"],
    "MDD": ["Aucune"],
    "Robotique": ["Aucune"],
    "AGROSUP": ["Aucune"],
  };
  String specialityValue = "Aucune";

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Compléter le profil'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          alignment: AlignmentDirectional.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              InkWell(
                
                borderRadius: BorderRadius.circular(300),


                //faire get image local(gallerie de photo)
                onTap: () {
                  imgFromGallery();
                },
                  child: CircleAvatar(
                radius: 55,
                backgroundColor: const Color(0xffFDCF09),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          imageFile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
               
                :Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.person_add_alt_outlined,
                          size: 50,
                        color: Colors.white,
                        ),
                      ),
                )),

                
              
            
              SizedBox(
                width: 340,
                child: TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: DropdownButton(
                  items: subjects
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    if (value != subjectValue) {
                      specialityValue = "Aucune";
                    }
                    subjectValue = value!;
                  }),
                  value: subjectValue,
                  borderRadius: BorderRadius.circular(12),
                  dropdownColor: Colors.blue[600],
                  underline: Container(
                    height: 0,
                  ),
                  elevation: 0,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: DropdownButton(
                  items: specialities[subjectValue]!
                      .toList()
                      .map((e) => DropdownMenuItem(
                            value: e.toString(),
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => specialityValue = value!),
                  value: specialityValue,
                  borderRadius: BorderRadius.circular(12),
                  dropdownColor: Colors.blue[600],
                  underline: Container(
                    height: 0,
                  ),
                  elevation: 0,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: DropdownButton(
                  items: years
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => yearValue = value!),
                  value: yearValue,
                  borderRadius: BorderRadius.circular(12),
                  dropdownColor: Colors.blue[600],
                  underline: Container(
                    height: 0,
                  ),
                  elevation: 0,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {

               
                userSetup(nameController.text.trim(),specialityValue,yearValue,subjectValue,imageFile!);

                //pour l'instant aller dans application.dart, 
                //changer pour que SI UTILISATEUR CONNECTE AVEC GOOGLE OU FACEBOOK, PAS BESOIN DE VERIF AVEC EMAIL//

                Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Application()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: const Size(340, 55),
                ),
                child: const Text(
                  "Continuer",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


/// Get from gallery
  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

   


}


