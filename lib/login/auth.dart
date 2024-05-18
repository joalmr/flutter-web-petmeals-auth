import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApp {
  Future<UserCredential?> signInGoogle() async {
    try {
      log('**signInGoogle**');
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log("**Error signIn => error: ${e.toString()}");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      // storage.box.erase();
    } catch (e) {
      log("**Error signOut => error: ${e.toString()}");
    }
  }

  Future<void> deleteUserAuth() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      await GoogleSignIn().signOut();
    } catch (e) {
      log("**Error deleteUserAuth => error: ${e.toString()}");
    }
  }
}
