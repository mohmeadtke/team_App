import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/main/Presentation/pages/no_team_page.dart';
import 'package:teamapp/Features/main/Presentation/state_mangmeant/bloc/main_page_bloc.dart';
import 'package:teamapp/core/widget/app_bar_widget.dart';

import '../../../../core/widget/side_bar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
// final GetProfileDataSourse getProfileDataSourse ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      backgroundColor: Colors.black,
      appBar: const AppBarWidget(
        pageNum: 0,
      ),
      body: BlocConsumer<MainPageBloc, MainPageState>(
        listener: (context, state) {
          if (state is MainPageFiallurState) {}
        },
        builder: (context, state) {
          if (state is MainPageLoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          } else if (state is MainPageSuccsesState) {
            return Center(
              child: Text(
                "${state.data[0].member}",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            );
          }
          return NoTeamPage();
          // Center(
          //   child: ElevatedButton(
          //       onPressed: () {
          //         context.read<MainPageBloc>().add(CheckIfUserHaveTeam());
          //       },
          //       child: Text("test")),
          // );
        },
      ),
    );
  }
}
