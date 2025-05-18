import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';

class CreateTeamDataSource {
  Future<Unit> createTeam(TeamEntity teamentity) async {
    //get the user id to updata the data

    final uid = FirebaseAuth.instance.currentUser?.uid;
    final firestore = FirebaseFirestore.instance;

// Auto-generate ID
    final newTeamDoc = firestore.collection('teams').doc();
    final teamId = newTeamDoc.id;

// Upload image
    Reference ref =
        FirebaseStorage.instance.ref().child("Team image/$teamId.jpg");
    UploadTask uploadTask = ref.putFile(teamentity.image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

// Upload data
    await newTeamDoc.set({
      'teamId': teamId,
      'teamName': teamentity.teamName,
      'passWord': teamentity.passWord,
      'teamImage': downloadUrl,
    });
    //add user and there roule in the team
    await newTeamDoc.collection('members').doc(uid).set({
      '$uid': 'owner',
    });

    // Add teamId to user's document
// Update user document
    await firestore.collection('users').doc(uid).update({
      'teams': FieldValue.arrayUnion([teamId])
    });

    return unit;
  }
}
