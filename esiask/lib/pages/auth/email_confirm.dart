import 'dart:async';
import 'package:esiask/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'complete.dart';

class VerifyEmailPage extends StatefulWidget {
  VerifyEmailPage({super.key,  required this.password});

  String password;

  
  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {

  final auth = FirebaseAuth.instance;
  late Timer timer;
  late User user;


  @override
  void initState() {
    
     print("VERIFYEMAILSTATE");
      user = auth.currentUser!;
      user.sendEmailVerification();
   
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (timer) => checkEmailVerified(),
      );
    
    super.initState();
  }

  Future<void> checkEmailVerified() async {
    //appelé après la vérif d'email//
        user = auth.currentUser!;
    await user.reload();

    
    if(user.emailVerified){
        timer.cancel();
        Navigator.of(context).
        pushReplacement(MaterialPageRoute(builder:(context)=>Complete(value: "",password: widget.password,)));
    }
   
    { 
  }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
      return MaterialApp(
         
            title:'Verify EMAIL',
          home:  Scaffold(
          
          body: Container(
              padding: EdgeInsets.only(bottom: 40, top: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'an verification email has been sent to ${user.email} ',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signOut();
                      },
                      child: const Text("Cancel"),
                    )
                  ]
                  )
                  )
          )
                  );
}
}