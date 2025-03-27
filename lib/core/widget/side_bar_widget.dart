import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teamapp/Features/profile/Presentation/pages/profile_page.dart';
import 'package:teamapp/core/widget/globl.dart';
import 'package:teamapp/ingectchin.dart' as di;

import '../../Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  final GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent.withOpacity(0.2),
                Colors.blueAccent.withOpacity(0.2)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.2),
                      Colors.blue.withOpacity(0.2)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                accountName: Text(
                  getIt<Globals>().email,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                accountEmail: Text(
                  getIt<Globals>().email,
                  style: const TextStyle(color: Colors.white70),
                ),
                currentAccountPicture: const CircleAvatar(
                    //todo backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
              ),
              _buildDrawerItem(Icons.home, 'Home', context, () {}),
              const Divider(
                endIndent: 50,
              ),
              _buildDrawerItem(
                Icons.person,
                'Profile',
                context,
                () {
                  final profileBloc =
                      di.sl<ProfileBloc>(); // Get the ProfileBloc instance
                  profileBloc
                      .add(LoadDataEvent()); // Dispatch event before navigating

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: profileBloc, // Pass the existing instance
                        child: const ProfilePage(),
                      ),
                    ),
                  );
                },
              ),
              const Divider(
                endIndent: 50,
              ),
              _buildDrawerItem(Icons.settings, 'Settings', context, () {}),
              const Divider(
                endIndent: 50,
              ),
              const Spacer(),
              const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, BuildContext context, fun) {
    return ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        onTap: fun);
  }
}
