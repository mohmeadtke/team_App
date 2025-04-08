import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';

class JoinTeamModel extends Jointeamentity {
  JoinTeamModel(
      {required super.teamName,
      required super.teamImage,
      required super.teamId,
      required super.passwrod});

  factory JoinTeamModel.fromJson(Map<String, dynamic> json) {
    return JoinTeamModel(
      teamId: json['teamId'] ?? '',
      passwrod: json['passwrod'] ?? '',
      teamName: json['teamName'] ?? '',
      teamImage: json['teamImage'] ?? '',
    );
  }
}
