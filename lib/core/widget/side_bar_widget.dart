import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teamapp/Features/profile/Presentation/pages/profile_page.dart';
import 'package:teamapp/ingectchin.dart' as di;

import '../../Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final GetIt getIt = GetIt.instance;
  late ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = context.read<ProfileBloc>();
    profileBloc.add(LoadDataEvent()); // Ensure the event is called
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        String name = "Loading...";
        String email = "Loading...";
        String image = "";
        if (state is SuccessState) {
          name = state.data.name;
          email = state.data.email;
          image = state.data.imageurl;
        }

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
                    accountEmail: Text(
                      email,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    accountName: Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    currentAccountPicture: CircleAvatar(
                      foregroundImage: image.isEmpty
                          ? const AssetImage('assets/images/anun.jpg')
                          : NetworkImage(image) as ImageProvider,
                    ),
                  ),
                  _buildDrawerItem(Icons.home, 'Home', context, () {
                    Navigator.pop(context);
                  }),
                  const Divider(endIndent: 50),
                  _buildDrawerItem(Icons.person, 'Profile', context, () {
                    Navigator.pop(context);
                    final profileBloc = di.sl<ProfileBloc>();
                    profileBloc.add(LoadDataEvent());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: profileBloc,
                          child: const ProfilePage(),
                        ),
                      ),
                    );
                  }),
                  const Divider(endIndent: 50),
                  _buildDrawerItem(Icons.settings, 'Settings', context, () {}),
                  const Divider(endIndent: 50),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
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
      },
    );
  }
}

Widget _buildDrawerItem(
    IconData icon, String title, BuildContext context, fun) {
  return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: fun);
}
