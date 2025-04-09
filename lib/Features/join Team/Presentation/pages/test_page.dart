import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/join%20Team/Presentation/State_mangmeant/bloc/join_team_bloc.dart';

import '../widget/serch_bar_widget.dart';
import '../widget/serch_list_widget.dart';

class TeamSearchPage extends StatelessWidget {
  const TeamSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Search Teams',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            const SearchBarWidget(),
            const SizedBox(height: 20),
            // 📋 Team List / Results
            BlocConsumer<JoinTeamBloc, JoinTeamState>(
              listener: (context, state) {
                if (state is FailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.messge)),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessState) {
                  final data = state.data;
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        "No teams found",
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  } else {
                    return SerchListWidget(data: data);
                  }
                } else if (state is FailureState) {
                  return Center(
                    child: Text(
                      state.messge,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Type something to search",
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
