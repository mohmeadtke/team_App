import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';

class ProfileModel extends ProfileGetEntity {
  ProfileModel(
      {required super.imageurl,
      required super.name,
      required super.email,
      required super.password});
  factory ProfileModel.fromJsonn(Map<String, dynamic> json) {
    return ProfileModel(
        password: json["passWord"],
        name: json["name"],
        // userId: json["userId"],
        email: json["email"],
        imageurl: json["imageurl"] ?? "");
  }
}
