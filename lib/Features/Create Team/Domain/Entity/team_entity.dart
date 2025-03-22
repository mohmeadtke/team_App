import 'dart:io';

class TeamEntity {
  final String ownerid;
  final String owner;
  final File image;
  final String teamName;
  final String passWord;

  TeamEntity(
      {required this.owner,
      required this.ownerid,
      required this.image,
      required this.teamName,
      required this.passWord});
}
