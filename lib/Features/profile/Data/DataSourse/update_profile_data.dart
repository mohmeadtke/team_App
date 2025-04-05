import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Domain/Entity/profile_update_entity.dart';

class UpdateProfileData {
  Future call(ProfileUpdateEntity updateData) async {
//get the user id to updata the data

    dynamic user = FirebaseAuth.instance.currentUser;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: await user.email)
        .get();
    String docId = querySnapshot.docs.first.id;

    //update image
    if (updateData.cheek == "image") {
      //upload data to stoge
      Reference ref =
          FirebaseStorage.instance.ref().child("profile image/$docId.jpg");
      UploadTask uploadTask = ref.putFile(updateData.image);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      //update data
      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        'imageurl': downloadUrl,
      });
    }
    //update name
    else if (updateData.cheek == "name") {
      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        'name': updateData.name,
      });
    }

    return unit;
  }
}
