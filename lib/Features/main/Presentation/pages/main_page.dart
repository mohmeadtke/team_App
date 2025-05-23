import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamapp/Features/main/Presentation/state_mangmeant/bloc/main_page_bloc.dart';
import 'package:teamapp/Features/main/widget/no_team_widget.dart';
import 'package:teamapp/core/widget/app_bar_widget.dart';
import '../../../../core/widget/side_bar_widget.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    context.read<MainPageBloc>().add(CheckIfUserHaveTeam());
  }

  Future<void> _handleRefresh() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) setState(() => _isRefreshing = false);
    context.read<MainPageBloc>().add(RefreshTeamData());
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF181A20);
    const cardGradient = LinearGradient(
      colors: [Color(0xFF23243A), Color(0xFF181A20)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    const accentColor = Color(0xFF7F5AF0);
    const secondaryAccent = Color(0xFF2CB67D);
    const cardShadow = [
      BoxShadow(
        color: Colors.black54,
        blurRadius: 16,
        offset: Offset(0, 8),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        drawer: const SideBar(),
        appBar: const AppBarWidget(pageNum: 0),
        body: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MainPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: accentColor),
              );
            } else if (state is MainPageSuccsesState) {
              if (state.data.isEmpty) {
                return noTeam(
                  accentColor: accentColor,
                  onButtonPressed: () {
                    context.read<MainPageBloc>().add(CheckIfUserHaveTeam());
                  },
                );
              } else {
                return RefreshIndicator(
                  color: accentColor,
                  backgroundColor: backgroundColor,
                  displacement: 40,
                  edgeOffset: 0,
                  onRefresh: () async {
                    setState(() => _isRefreshing = true);
                    await Future.delayed(const Duration(milliseconds: 800));
                    context.read<MainPageBloc>().add(RefreshTeamData());
                    setState(() => _isRefreshing = false);
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final team = state.data[index];
                      final teamImage = team.teamImageUrl;
                      final teamName = team.teamName;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            gradient: cardGradient,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: cardShadow,
                            border: Border.all(
                              color: accentColor.withOpacity(0.15),
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: accentColor.withOpacity(0.7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      teamImage,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                          Icons.broken_image,
                                          size: 80,
                                          color: Colors.grey),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                                  color: accentColor)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        teamName,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(Icons.person,
                                              color: secondaryAccent, size: 18),
                                          const SizedBox(width: 6),
                                          Text(
                                            "${team.member.length} members",
                                            style: GoogleFonts.poppins(
                                              color: accentColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return noTeam(
              accentColor: accentColor,
              onButtonPressed: () {
                context.read<MainPageBloc>().add(CheckIfUserHaveTeam());
              },
            );
          },
        ),
      ),
    );
  }
}
