import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';

class JoinTeamModel extends Jointeamentity {
  JoinTeamModel(
      {required super.teamName,
      required super.teamImage,
      required super.teamId,
      required super.password});

  factory JoinTeamModel.fromJson(Map<String, dynamic> json) {
    return JoinTeamModel(
      teamId: json['teamId'] ?? '',
      password: json['passWord'] ?? '',
      teamName: json['teamName'] ?? '',
      teamImage: json['teamImage'] ?? '',
    );
  }
}
