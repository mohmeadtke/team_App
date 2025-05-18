import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamapp/Features/main/Data/model/teams_id_model.dart';

class CheckUserHaveTeamDataSource {
  Future<List<String>> checkFun() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    // Query Firestore to find the document with the matching email
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    var userData =
        TeamsIdModel.fromJsonn(userDoc.data() as Map<String, dynamic>);

    print("userData : ${userData}");
    return userData.teamsId;
  }
}
