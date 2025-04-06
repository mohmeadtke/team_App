import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';

class CreateTeamDataSource {
  Future<Unit> createTeam(TeamEntity teamentity) async {
    //get the user id to updata the data

    dynamic user = FirebaseAuth.instance.currentUser;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: await user.email)
        .get();
    String docId = querySnapshot.docs.first.id;
    //check the counter to give a team id

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentReference counterDoc =
        firestore.collection('team_counter').doc('counter');

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

    String teamId = nextId.toString();

    //uplode image to storge
    Reference ref =
        FirebaseStorage.instance.ref().child("Team image/$teamId.jpg");
    UploadTask uploadTask = ref.putFile(teamentity.image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    DocumentReference userDoc = firestore.collection('teams').doc(teamId);
    batch.set(userDoc, {
      'ownerId': docId,
      'teamId': teamId,
      'teamName': teamentity.teamName,
      'passWord': teamentity.passWord,
      'teamImage': downloadUrl
    });

    // Commit the batch
    await batch.commit();

    print("team added with custom ID: $teamId");
    return unit;
  }
}
