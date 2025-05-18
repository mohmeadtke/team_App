import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Domain/Entity/profile_update_entity.dart';

class UpdateProfileData {
  Future call(ProfileUpdateEntity updateData) async {
//get the user id to updata the data

    final docId = FirebaseAuth.instance.currentUser?.uid;

    //update image
    if (updateData.cheek == "image") {
      //upload image to stoge
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
    else if (updateData.cheek=="bio"){

      await FirebaseFirestore.instance.collection('users').doc(docId).update({
        'bio': updateData.bio,
      });
    }

    return unit;
  }
}
