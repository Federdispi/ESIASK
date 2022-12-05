import 'dart:async';
import 'package:esiask/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../application/application.dart';
import 'complete.dart';

class VerifyEmailPage extends StatefulWidget {
   const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  // ignore: prefer_typing_uninitialized_variables
  Timer? timer;
  @override
  void initState() {
    super.initState();
    print("hahahahHAHAHAHHA" '\n');
    print(FirebaseAuth.instance.currentUser!.emailVerified);
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified == false) {
      sendEmailVerification_();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  checkEmailVerified() async {
    //appelé après la vérif d'email//

    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified == true) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Complete(value: "")
      : MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: const Text('Verify EMAIL'),
          ),
          body: Container(
              padding: EdgeInsets.only(bottom: 40, top: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "an verification email has been sent to your email",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text("Cancel"),
                    )
                  ]
                  )
                  )
                  ));
}