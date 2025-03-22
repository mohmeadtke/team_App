import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';

class CreateTeamDataSource {
  Future<Unit> createTeam(TeamEntity teamentity, String teamUrl) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the counter document
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

    DocumentReference userDoc = firestore.collection('teams').doc(teamId);
    batch.set(userDoc, {
      'ownerId': teamentity.ownerid,
      'ownerName': teamentity.owner,
      'teamName': teamentity.teamName,
      'teamId': teamId,
      'passWord': teamentity.passWord,
      'teamImage': teamUrl
    });

    // Commit the batch
    await batch.commit();

    print("team added with custom ID: $teamId");
    return unit;
  }
}
