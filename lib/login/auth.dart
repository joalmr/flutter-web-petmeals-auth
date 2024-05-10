import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApp {
  Future<UserCredential?> signInGoogle() async {
    try {
      print('**signInGoogle**');
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("**Error signIn => error: ${e.toString()}");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      // storage.box.erase();
    } catch (e) {
      print("**Error signOut => error: ${e.toString()}");
    }
  }

  Future<void> deleteUserAuth() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      await GoogleSignIn().signOut();
    } catch (e) {
      print("**Error deleteUserAuth => error: ${e.toString()}");
    }
  }
}
