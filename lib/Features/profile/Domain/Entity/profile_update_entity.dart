import 'dart:io';

class ProfileUpdateEntity {
  final String cheek;
  final File image;
  final String name;
  final String passWord;

  ProfileUpdateEntity(
      {required this.cheek,
      required this.image,
      required this.name,
      required this.passWord});
}
