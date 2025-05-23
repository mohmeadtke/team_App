import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/failure.dart';

class JoinTeamDataSource {
  Future<Either<Failure, Unit>> joinTeamFun(String teamId) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final firestore = FirebaseFirestore.instance;

    // Add the team ID to the user's list of teams
    await firestore.collection('users').doc(uid).update({
      'teams': FieldValue.arrayUnion([teamId])
    });

    // Reference to the team document
    final teamDocRef = firestore.collection('teams').doc(teamId);
    final teamSnapshot = await teamDocRef.get();

    if (!teamSnapshot.exists) {
      return const Left(Failure.invalidData());
    }

    // Get current members
    final data = teamSnapshot.data();
    final members = data?['members'] as Map<String, dynamic>? ?? {};

    // Check if user is already a member
    if (members.containsKey(uid)) {
      return const Right(unit); // Already a member, do nothing
    }

    // Otherwise, update the members map
    WriteBatch batch = firestore.batch();
    batch.update(teamDocRef, {
      'members.$uid': 'member',
    });
    await batch.commit();

    return const Right(unit);
  }
}
