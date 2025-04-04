import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  Future<Unit> signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return unit;
  }
}
