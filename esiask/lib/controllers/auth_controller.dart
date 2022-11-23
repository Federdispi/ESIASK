import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../pages/auth/complete.dart';

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

final fbLogin = FacebookLogin();
Future signInFB() async {
  final FacebookLoginResult result = await fbLogin.logIn(["email"]);
  final String token = result.accessToken.token;
  final response = await http.get(Uri.parse(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
  final profile = jsonDecode(response.body);
  print(profile);
  return profile;
}

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

Future<void> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  try {
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
