import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount {
  Future<Unit> createAccount(String name, String email, String password) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // Send verification email
    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print('Verification email has been sent.');
    }
    dynamic authUser = FirebaseAuth.instance.currentUser;
    // Create the new user document in Firestore with userId as the document ID

    firestore.collection('users').doc(authUser.uid).set({
      'name': name,
      'email': email,
      'userId': authUser.uid,
      'passWord': password,
    });

    print("User added with custom ID: ${authUser.uid}");
    return unit;
  }
}
