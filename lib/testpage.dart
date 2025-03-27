import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/main/widget/custom_button.dart';
import 'package:teamapp/Features/profile/Data/DataSourse/get_profile_data_sourse.dart';
import 'package:teamapp/Features/profile/Domain/UseCase/get_profile_data_usecase.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';
import 'package:teamapp/core/widget/app_bar_widget.dart';
import 'package:teamapp/ingectchin.dart';

import 'core/widget/side_bar_widget.dart';

class Testpage extends StatelessWidget {
  const Testpage({super.key});
// final GetProfileDataSourse getProfileDataSourse ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
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
              context.read<ProfileBloc>().add(LoadDataEvent());
              // print("helowwwwwwwwwwwwww");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Create Team',
            onTap: () {},
          ),
          const Spacer()
        ],
      ),
    );
  }
}
