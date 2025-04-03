import 'dart:io';

class ProfileUpdateEntity {
  final File image;
  final String name;
  final String passWord;

  ProfileUpdateEntity(
      {required this.image, required this.name, required this.passWord});
}
