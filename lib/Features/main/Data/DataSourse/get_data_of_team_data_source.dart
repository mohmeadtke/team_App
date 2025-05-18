import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamapp/Features/main/Domain/Entity/main-page_entity.dart';

class GetDataOfTeamDataSource {
  Future<MainPageEntity> getTeamData(String teamId) async {
    //update name
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('teams')
        .doc(teamId) // replace with the actual user ID
        .get();
    var teamData = userDoc.data() as Map<String, dynamic>;
    return;
  }
}
