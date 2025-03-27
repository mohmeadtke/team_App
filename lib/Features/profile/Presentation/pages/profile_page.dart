import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';

import '../../../../core/widget/globl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool see = false;

  void activateBall() {
    setState(() {
      see = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        see = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
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
                child: CircularProgressIndicator(color: Colors.white));
          } else if (state is SuccessState) {
            final ProfileGetEntity profileData = state.data;
            getIt<Globals>().email = profileData.email;
            getIt<Globals>().name = profileData.name;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const CircleAvatar(
                      radius: 60,
                      // backgroundImage: NetworkImage(profileData['imageUrl']!),
                      backgroundColor:
                          const Color(0xFF16213E), // Deep dark blue
                    ),
                    const SizedBox(height: 20),
                    Text(
                      profileData.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profileData.email,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFF0F3460), // Dark purple-blue
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Text(
                              "Ur PassWord: ${see ? profileData.password : "*******"}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                activateBall();
                              },
                              icon: see
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Future.microtask(
                            () => Navigator.pushReplacementNamed(context, '/'));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF53354A), // Darker purple
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.logout, color: Colors.white, size: 24),
                            SizedBox(width: 10),
                            Text(
                              "Log Out",
                              style: TextStyle(
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
          return const Center(
            child: Text('No Data Available',
                style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
