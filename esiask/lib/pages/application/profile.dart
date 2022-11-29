import 'package:esiask/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../../controllers/firebase.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

final user = FirebaseAuth.instance.currentUser!;
 

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      
      body:Container(alignment: Alignment.center,color:Colors.black,child:Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

ElevatedButton(
            onPressed: () => signOut(), child: const Text("LogOut")
            ),

   
            
Text(
  'Email${user.email!}',
  style:TextStyle(color:Colors.white,fontSize:16)
),

ProfilePicture(
    name: '${user.displayName}',
    radius: 31,
    fontsize: 21,
    img: '${getData(user.uid)}'
),
          

],


      ))
    );
  }
}
