import 'dart:io';

class ProfileUpdateEntity {
  final File image;
  final String name;
  final String passWord;

  ProfileUpdateEntity(this.image, this.name, this.passWord);
}
