import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/failure.dart';

class JoinTeamDataSource {
  Future<Either<Failure, Unit>> joinTeamFun(String teamId) async {
    // add the usre to the tame
    dynamic user = FirebaseAuth.instance.currentUser;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: await user.email)
        .get();
    String docId = querySnapshot.docs.first.id;
    //add the team id in user data
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .update({'teamId': teamId});
    // add the usre to the tame
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    DocumentReference userDoc = firestore.collection('teams').doc(teamId);
    batch.update(userDoc, {
      'members': FieldValue.arrayUnion([docId])
    });

// Don't forget to commit the batch
    await batch.commit();

    return const Right(unit);
  }
}
