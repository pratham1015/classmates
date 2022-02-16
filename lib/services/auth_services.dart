import 'package:classmates/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.userChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    showCircularProgressIndicator(context);
    final credential = await _firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .whenComplete(() => Navigator.of(context).pop());
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    showCircularProgressIndicator(context);
    final credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => Navigator.of(context).pop());
    return _userFromFirebase(credential.user);
  }

  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    showCircularProgressIndicator(context);
    return await _firebaseAuth
        .sendPasswordResetEmail(email: email)
        .whenComplete(() => Navigator.of(context).pop());
  }

  Future<void> signOut(BuildContext context) async {
    showCircularProgressIndicator(context);
    return await _firebaseAuth
        .signOut()
        .whenComplete(() => Navigator.pop(context));
  }

  Future<dynamic> showCircularProgressIndicator(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
