import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Repo/team_repo.dart';

//making the ui for some pageis
//making the fun for the firebase
class UserFormPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<File?> _selectedImage = ValueNotifier<File?>(null);
  final TeamRepo teamRepo; // Injected repository
  final ImagePicker _picker = ImagePicker();

  UserFormPage({super.key, required this.teamRepo});

  // Constructor injection for the repository

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage.value = File(pickedFile.path);
    }
  }

  void _submitForm(BuildContext context) {
    final teamName = _nameController.text;
    final password = _passwordController.text;
    final image = _selectedImage.value;

    if (teamName.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image.')),
      );
      return;
    }

    final teamEntity = TeamEntity(
      owner: 'Owner Name', // Replace with actual owner info
      ownerid: 'Owner ID', // Replace with actual owner ID
      image: image,
      teamName: teamName,
      passWord: password,
    );

    // Call the repository method
    try {
      teamRepo.createTeam(teamEntity);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Team created successfully!')),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create team: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16),
            ValueListenableBuilder<File?>(
              valueListenable: _selectedImage,
              builder: (context, image, _) {
                return image != null
                    ? Image.file(
                        image,
                        height: 150,
                      )
                    : Text('No image selected',
                        style: TextStyle(color: Colors.red));
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submitForm(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
