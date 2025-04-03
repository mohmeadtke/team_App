import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';

import '../modle/data_modle.dart';

class GetProfileDataSourse {
  Future<ProfileGetEntity> getData() async {
    dynamic user = FirebaseAuth.instance.currentUser;
    // print("gg");
    // profileGetEntity.email = await user.email;
    // print("${profileGetEntity.email}");

    // Query Firestore to find the document with the matching email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: await user.email)
        .get();

    // Get the first matching document
    final userData = querySnapshot.docs.first.data();
    print("User data: $userData");
    final result = ProfileModel.fromJsonn(userData as Map<String, dynamic>);
    return result;
  }
}
