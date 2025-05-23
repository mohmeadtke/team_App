import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Presentation/pages/change_user_name_page.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';
import 'package:teamapp/core/localDataSaved/user_data_local_storge.dart';
import '../../../../ingectchin.dart' as di;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool see = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, dynamic profileData) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final image = File(pickedFile.path);
      context.read<ProfileBloc>().add(UpdateDataEvent(
          profileUpdateEntity: ProfileUpdateEntity(
              cheek: "image",
              image: image,
              name: profileData.name,
              passWord: profileData.password,
              bio: '')));
    }
    return;
  }

  void activateBall() {
    setState(() {
      see = true;
    });

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        see = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF7F5AF0);
    const backgroundColor = Color(0xFF181A20);
    const cardGradient = LinearGradient(
      colors: [Color(0xFF23243A), Color(0xFF181A20)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: cardGradient,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is FailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.messge,
                      style: const TextStyle(color: Colors.red))),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: accentColor));
          } else if (state is SuccessState) {
            String image = "";
            final ProfileGetEntity profileData = state.data;
            image = state.data.imageurl;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: cardGradient,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: image.isEmpty
                                  ? const AssetImage('assets/images/anun.jpg')
                                  : NetworkImage(image) as ImageProvider,
                              backgroundColor: backgroundColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90, left: 70),
                            child: GestureDetector(
                              onTap: () {
                                _pickImage(ImageSource.gallery, profileData);
                              },
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: accentColor.withOpacity(0.3),
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: const Icon(Icons.camera_alt,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          profileData.name,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              final profileBloc = di.sl<ProfileBloc>();
                              profileBloc.add(LoadDataEvent());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                    value: profileBloc,
                                    child: ChangeUsernamePage(
                                      currentUsername: profileData.name,
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit, color: accentColor)),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      profileData.email,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Password: ${see ? profileData.password : "*******"}",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                activateBall();
                              },
                              icon: Icon(
                                  see ? Icons.visibility : Icons.visibility_off,
                                  color: accentColor)),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        await UserDataCache().clearCache();
                        await FirebaseAuth.instance.signOut();
                        Future.microtask(
                            () => Navigator.pushReplacementNamed(context, '/'));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.logout,
                                color: Colors.white, size: 24),
                            const SizedBox(width: 10),
                            Text(
                              "Log Out",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Text('No Data Available',
                style: GoogleFonts.poppins(color: Colors.white)),
          );
        },
      ),
    );
  }
}
