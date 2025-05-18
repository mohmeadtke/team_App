import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/failure.dart';

class JoinTeamDataSource {
  Future<Either<Failure, Unit>> joinTeamFun(String teamId) async {
    // get the user id
    final uid = FirebaseAuth.instance.currentUser?.uid;

    //add the team id in user data
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'teams': FieldValue.arrayUnion([teamId])
    });
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference userDoc = firestore
        .collection('teams')
        .doc(teamId)
        .collection('members')
        .doc(uid);

// Check if the user document already exists
    DocumentSnapshot userSnapshot = await userDoc.get();
    WriteBatch batch = firestore.batch();

    if (!userSnapshot.exists) {
      // Only update if the user is not already in the members
      batch.set(userDoc, {
        'role': "member", // Use a clear key like 'role'
      });
    }

    // Don't forget to commit the batch
    await batch.commit();

    return const Right(unit);
  }
}
