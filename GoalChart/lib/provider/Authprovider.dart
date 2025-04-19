
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class AuthPresenter extends ChangeNotifier{
  String error='';
  
  
  AuthPresenter();
  FirebaseAuth _auth=FirebaseAuth.instance;

  Future <User?> Signin(String email,String password) async{
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        return userCredential.user;
      }on FirebaseAuthException catch (e) {
      error = 'SignIn failed: ${e.message}';
      return null;
      }
  }
  Future<User?> Signup(String email,String password) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      error = 'SignUp failed: ${e.message}';
      return null;
      }
  }
}