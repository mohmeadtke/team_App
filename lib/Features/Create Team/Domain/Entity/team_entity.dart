import 'dart:io';

class TeamEntity {
  final File image;
  final String teamName;
  final String passWord;

  TeamEntity(
      {required this.image, required this.teamName, required this.passWord});
}
