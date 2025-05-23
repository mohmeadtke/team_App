import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';

class TeamsModel extends TeamsEntity {
  TeamsModel(
      {required super.teamName,
      required super.teamId,
      required super.teamImageUrl,
      required super.member,
      required super.membersMap});
  factory TeamsModel.fromJson(Map<String, dynamic> json) {
    final membersMap = json['members'] as Map<String, dynamic>? ?? {};

    return TeamsModel(
      teamName: json["teamName"],
      teamId: json["teamId"],
      teamImageUrl: json["teamImage"] ?? "",
      membersMap: membersMap,
      member: membersMap.keys.toList(),
    );
  }
}
