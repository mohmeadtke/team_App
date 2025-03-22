import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount {
  Future<Unit> createAccount(String name, String email, String password) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the counter document
    DocumentReference counterDoc =
        firestore.collection('user_counter').doc('counter');

    // try {
    // Get a write batch to perform multiple writes
    WriteBatch batch = firestore.batch();

    // Get the current counter value
    DocumentSnapshot counterSnapshot = await counterDoc.get();

    // Initialize nextId if counter document doesn't exist
    int nextId = 0;
    if (counterSnapshot.exists) {
      nextId = (counterSnapshot.data() as Map<String, dynamic>)['nextId'];
      batch.update(counterDoc, {'nextId': FieldValue.increment(1)});
    } else {
      batch.set(
          counterDoc, {'nextId': 1}); // Initialize counter with nextId set to 1
    }

    // Convert nextId to string to use as user ID
    String userId = nextId.toString();
    // Create a new user with Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // Send verification email
    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print('Verification email has been sent.');
    }
    // Create the new user document in Firestore with userId as the document ID
    DocumentReference userDoc = firestore.collection('users').doc(userId);
    batch.set(userDoc,
        {'name': name, 'email': email, 'userId': userId, 'passWord': password});

    // Commit the batch
    await batch.commit();

    print("User added with custom ID: $userId");
    return unit;
    // } catch (error) {
    //   print("Failed to add user: $error");
    //   return left("Failed to create account: $error");
  }
}
