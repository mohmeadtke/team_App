import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamapp/Features/main/Data/model/teams_model.dart';
import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';

class GetDataOfTeamDataSource {
  Future<List<TeamsEntity>> getTeamData(List<String> teamsId) async {
    List<TeamsEntity> teams = [];

    for (String id in teamsId) {
      final docSnapshot =
          await FirebaseFirestore.instance.collection('teams').doc(id).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final team = TeamsModel.fromJson(data);
        teams.add(team);
      }
    }
    print("teams : $teams");
    return teams;
  }
}
