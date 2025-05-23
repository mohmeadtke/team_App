import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';

class ChangeUsernamePage extends StatelessWidget {
  const ChangeUsernamePage({super.key, required this.currentUsername});
  final String currentUsername;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    const accentColor = Color(0xFF7F5AF0);
    const backgroundColor = Color(0xFF181A20);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Edit Profile',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF23243A), Color(0xFF181A20)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change Username',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Enter new username',
                hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (usernameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                            child: Text(
                          'User name cannot be empty',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 18),
                        )),
                        backgroundColor: Colors.red[700],
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
                    SnackBar(
                      content: Center(
                          child: Text(
                        'User name updated!',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      )),
                      backgroundColor: Colors.green[700],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  elevation: 8,
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Current Username: $currentUsername',
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
