import 'package:cloud_firestore/cloud_firestore.dart';

class GetTeamDataSource {
  Future<List> getTeams(String teamName) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('teams')
        .where('teamName', isEqualTo: teamName)
        .get();

    List<Map<String, dynamic>> results = querySnapshot.docs
        .map((doc) => {
              ...doc.data() as Map<String, dynamic>,
              'Id': doc.id, // Add the userId from the document ID
            })
        .toList();
    return results;
  }
}
