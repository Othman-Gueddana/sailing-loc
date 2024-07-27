import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sailing_loc/global/common/toast.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String username, String email,
      String password, String fname, lname) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: "Cette addresse e-mail est déjà utilisée");
      } else {
        showToast(message: "une erreur s'est produite ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found)') {
        showToast(message: "email addresse invalide");
      } else if (e.code == 'wrong-password)') {
        showToast(message: "mot de passe incorrect");
      } else {
        showToast(message: "une erreur s'est produite${e.code}");
      }
      print("une erreur s'est produite");
    }
    return null;
  }
}
