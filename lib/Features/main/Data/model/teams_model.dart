import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';

class TeamsModel extends TeamsEntity {
  TeamsModel(
      {required super.teamName,
      required super.teamId,
      required super.teamImageUrl,
      required super.member});
  factory TeamsModel.fromJson(Map<String, dynamic> json) {
    return TeamsModel(
      teamName: json["teamName"],
      teamId: json["teamId"],
      teamImageUrl: json["teamImage"] ?? "",
      member: List<String>.from(json["members"] ?? []),
    );
  }
}
