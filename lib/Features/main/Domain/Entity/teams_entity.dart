class TeamsEntity {
  final String teamName;
  final String teamId;
  final String teamImageUrl;
  final List member;

  TeamsEntity(
      {
      required this.teamName,
      required this.teamId,
      required this.teamImageUrl,
      required this.member});
}
