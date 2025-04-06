import 'package:flutter/material.dart';

class TeamSearchPage extends StatefulWidget {
  const TeamSearchPage({super.key});

  @override
  State<TeamSearchPage> createState() => _TeamSearchPageState();
}

class _TeamSearchPageState extends State<TeamSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allTeams = [
    "Lions Squad",
    "Falcon Force",
    "Eagle Eyes",
    "Shadow Strikers",
    "Cyber Ninjas",
    "Code Avengers",
    "Dream Builders",
  ];
  List<String> filteredTeams = [];

  @override
  void initState() {
    super.initState();
    filteredTeams = allTeams;
  }

  void _filterTeams(String query) {
    final results = allTeams
        .where((team) => team.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredTeams = results;
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

            // 📋 Team List
            Expanded(
              child: filteredTeams.isEmpty
                  ? const Center(
                      child: Text(
                        'No teams found',
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredTeams.length,
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
                              const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white12,
                                child: Icon(Icons.group, color: Colors.white),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                filteredTeams[index],
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
            ),
          ],
        ),
      ),
    );
  }
}
