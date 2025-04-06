import 'package:firebase_storage/firebase_storage.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';

class AddTeamImage {
  Future<String> uploadImage(TeamEntity teamentity) async {
    final ownerid = teamentity.teamName.toString();
    // Reference to the storage location
    final storageRef =
        FirebaseStorage.instance.ref().child('Teamimages/$ownerid.jpg');

    // Upload the file
    final uploadTask = storageRef.putFile(teamentity.image);

    // Wait for the upload to complete and get the download URL
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();

    print("Image uploaded successfully: $downloadUrl");
    return downloadUrl; // Return the image URL
  }
}
