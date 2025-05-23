class TeamsEntity {
  final String teamName;
  final String teamId;
  final String teamImageUrl;
  final Map<String, dynamic> membersMap;
  final List<String> member;

  TeamsEntity(
      {required this.teamName,
      required this.teamId,
      required this.teamImageUrl,
      required this.member,
      required this.membersMap});
}
