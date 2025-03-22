import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

//166
//1 git
class JoinTeamDataSource {
  Future<Either<Failure, Unit>> joinTeamFun(
      Jointeamentity jointeamentity) async {
    // Reference to the Firestore document inside the "teams" collection
    final teamDoc = FirebaseFirestore.instance
        .collection('teams')
        .doc(jointeamentity.teamId);

    // Fetch the team document
    final snapshot = await teamDoc.get();

    // Get the password stored in Firestore
    final teamData = snapshot.data();
    final storedPassword = teamData?['passWord'];

    // Compare the entered password with the stored password
    if (jointeamentity.passwrod == storedPassword) {
      // Passwords match; proceed to write additional data
      await teamDoc.update({
        'userId': jointeamentity.userId,
        'userName': jointeamentity.userName,
        'joinedAt': FieldValue.serverTimestamp(),
      });
      print('User added to the team successfully.');
      return const Right(unit);
    } else {
      print('Incorrect password.');
      return const Left(
          Failure.wrongPassword(massge: "the password is not correct"));
    }
  }
}
