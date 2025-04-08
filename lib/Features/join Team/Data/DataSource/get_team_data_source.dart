import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';

import '../model/join_team_model.dart';

class GetTeamDataSource {
  Future<List<Jointeamentity>> getTeams(String teamName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('teams')
        .where('teamName', isGreaterThanOrEqualTo: teamName)
        .where('teamName', isLessThan: '${teamName}z')
        .get();

    print(teamName);
    print("the snap is ${querySnapshot.docs}");
    List<Jointeamentity> results = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['teamId'] = doc.id; // Set document ID manually
      return JoinTeamModel.fromJson(data);
    }).toList();

    print(results);
    return results;
  }
}
