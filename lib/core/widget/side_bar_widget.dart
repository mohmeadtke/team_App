import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamapp/Features/profile/Presentation/pages/profile_page.dart';
import 'package:teamapp/Features/join%20Team/Presentation/pages/team_search_page.dart';
import 'package:teamapp/Features/Create%20Team/Presentation/pages/create_team_page.dart';
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
  bool showTeamOptions = false;

  @override
  void initState() {
    super.initState();
    profileBloc = context.read<ProfileBloc>();
    profileBloc.add(LoadDataEvent());
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF23243A), Color(0xFF181A20)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    accountEmail: Text(
                      email,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    accountName: Text(
                      name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 32,
                      backgroundColor: const Color(0xFF23243A),
                      foregroundImage: image.isEmpty
                          ? const AssetImage('assets/images/anun.jpg')
                          : NetworkImage(image) as ImageProvider,
                    ),
                  ),
                  _buildDrawerItem(Icons.home, 'Home', context, () {
                    Navigator.pop(context);
                  }),
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
                  // Collapsible Teams Section
                  ListTile(
                    leading: Icon(Icons.group, color: const Color(0xFF7F5AF0)),
                    title: Text(
                      'Teams',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      showTeamOptions
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        showTeamOptions = !showTeamOptions;
                      });
                    },
                  ),
                  if (showTeamOptions)
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Column(
                        children: [
                          _buildDrawerItem(
                              Icons.add_circle_outline, 'Create Team', context,
                              () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/createTeamPage');
                          }),
                          _buildDrawerItem(Icons.search, 'Join Team', context,
                              () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/joinTeamPage');

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const TeamSearchPage(),
                            //   ),
                            // );
                          }),
                        ],
                      ),
                    ),
                  _buildDrawerItem(Icons.settings, 'Settings', context, () {}),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Version 1.0.0',
                      style: GoogleFonts.poppins(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
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
    IconData icon, String title, BuildContext context, Function() fun) {
  return ListTile(
    leading: Icon(icon, color: const Color(0xFF7F5AF0)),
    title: Text(
      title,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: fun,
  );
}
