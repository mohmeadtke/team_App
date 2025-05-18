import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';

class ChangeUsernamePage extends StatelessWidget {
  const ChangeUsernamePage({super.key, required this.currentUsername});
  final String currentUsername;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
//todo distrpude some widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Username',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Enter new username',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (usernameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Center(
                            child: Text(
                          'User name cannot be empty',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                        backgroundColor: Color.fromARGB(221, 250, 3, 3),
                      ),
                    );
                    return;
                  }
                  final data = UpdateDataEvent(
                      profileUpdateEntity: ProfileUpdateEntity(
                          cheek: "name",
                          image: File(""),
                          name: usernameController.value.text,
                          passWord: "",
                          bio: ''));

                  context.read<ProfileBloc>().add(data);
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                          child: Text(
                        'User name updated!',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                      backgroundColor: Color.fromARGB(221, 60, 250, 3),
                    ),
                  );
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Current Username: $currentUsername',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
