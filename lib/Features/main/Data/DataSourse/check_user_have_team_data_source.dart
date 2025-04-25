import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckUserHaveTeamDataSource {
  Future<String> checkFun() async {
    dynamic user = FirebaseAuth.instance.currentUser;

    // Query Firestore to find the document with the matching email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user.email) // no need to `await` user.email
        .get();

    var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;

    if (userData.containsKey('teamId') && userData['teamId'] != null) {
      return userData['teamId'];
    } else {
      return "";
    }
  }
}
