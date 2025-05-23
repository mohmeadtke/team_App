import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamapp/Features/join%20Team/Presentation/State_mangmeant/bloc/join_team_bloc.dart';
import '../widget/serch_bar_widget.dart';
import '../widget/serch_list_widget.dart';

class TeamSearchPage extends StatelessWidget {
  const TeamSearchPage({super.key});

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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Search Teams',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: cardGradient,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SearchBarWidget(),
            const SizedBox(height: 20),
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
                    child: CircularProgressIndicator(color: accentColor),
                  );
                } else if (state is SuccessState) {
                  final data = state.data;
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        "No teams found",
                        style: GoogleFonts.poppins(color: Colors.white70),
                      ),
                    );
                  } else {
                    return SerchListWidget(data: data);
                  }
                } else if (state is FailureState) {
                  return Center(
                    child: Text(
                      state.messge,
                      style: GoogleFonts.poppins(color: Colors.redAccent),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Type something to search",
                      style: GoogleFonts.poppins(color: Colors.white70),
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
