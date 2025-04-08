import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/join%20Team/Presentation/State_mangmeant/bloc/join_team_bloc.dart';

class TeamSearchPage extends StatefulWidget {
  const TeamSearchPage({super.key});

  @override
  State<TeamSearchPage> createState() => _TeamSearchPageState();
}

class _TeamSearchPageState extends State<TeamSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Timer? _debounce;

  void _filterTeams(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<JoinTeamBloc>().add(SerchForTeamEvent(teamName: query));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Search Teams', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterTeams,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search teams...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<JoinTeamBloc, JoinTeamState>(
                listener: (context, state) {
              if (state is FailureState) {
                Center(
                  child: Text(state.messge),
                );
              }
            }, builder: (context, state) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SuccessState) {
                final data = state.data;
                print(data);
                if (data == null || data == 0 || data.length == 0) {
                  return const Text("no team found ");
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[800],
                                child: data[index].teamImage == ""
                                    ? const Icon(
                                        Icons.group,
                                        color: Colors.white70,
                                        size: 30,
                                      )
                                    : ClipOval(
                                        child: Image.network(
                                          data[index].teamImage,
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                data[index].teamName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              } else if (state is FailureState) {
                return Center(
                  child: Text(state.messge),
                );
              } else {
                return const Center(child: Text("type something to serch "));
              }
            }),
            // 📋 Team List
          ],
        ),
      ),
    );
  }
}
