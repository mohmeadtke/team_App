import 'package:flutter/material.dart';
import 'package:teamapp/Features/join%20Team/Presentation/pages/test_page.dart';
import 'package:teamapp/core/widget/custom_button.dart';
import 'package:teamapp/core/widget/app_bar_widget.dart';

import 'core/widget/side_bar_widget.dart';

class Testpage extends StatelessWidget {
  const Testpage({super.key});
// final GetProfileDataSourse getProfileDataSourse ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      backgroundColor: Colors.black,
      appBar: const AppBarWidget(
        pageNum: 0,
      ),
      body: Column(
        children: [
          const Spacer(),
          const Center(
            child: Text(
              "join a Team or Create Team \n to use this App",
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Join Team',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TeamSearchPage()));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Create Team',
            onTap: () {
              Navigator.pushNamed(context, '/createTeamPage');
            },
          ),
          const Spacer()
        ],
      ),
    );
  }
}
