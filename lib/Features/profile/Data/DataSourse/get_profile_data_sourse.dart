import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';

import '../model/data_modle.dart';

class GetProfileDataSourse {
  Future<ProfileGetEntity> getData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    // Query Firestore to find the document with the matching email
    final documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    print("thet DocumentSnapshot : ${documentSnapshot.data()}");
    // Get the first matching document

    final result =
        ProfileModel.fromJsonn(documentSnapshot.data() as Map<String, dynamic>);
    print("result :  $result");
    return result;
  }
}
