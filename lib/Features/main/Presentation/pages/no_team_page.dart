import 'package:flutter/material.dart';
import 'package:teamapp/core/widget/custom_button.dart';

class NoTeamPage extends StatelessWidget {
  const NoTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Navigator.pushNamed(context, '/joinTeamPage');
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
    );
  }
}
