import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';

class GetProfileDataSourse {
  final ProfileGetEntity profileGetEntity;

  GetProfileDataSourse({required this.profileGetEntity});

  Future<void> getData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        print("No user is signed in.");
        return;
      }

      profileGetEntity.email = user.email ?? '';

      // Query Firestore to find the document with the matching email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        print("User Data: $userData");
      } else {
        print("No user found with this email.");
      }
    } catch (e) {
      print("Error getting user data: $e");
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  ProfileGetEntity profileEntity =
      ProfileGetEntity(email: "", imageurl: '', name: '', password: '');
  GetProfileDataSourse profileDataSource =
      GetProfileDataSourse(profileGetEntity: profileEntity);

  profileDataSource.getData(); // Call the function to test
}
