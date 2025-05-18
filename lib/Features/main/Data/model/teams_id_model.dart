import 'package:teamapp/Features/main/Domain/Entity/teams_id_entity.dart';

class TeamsIdModel extends TeamsIdEntity {
  TeamsIdModel({
    required super.teamsId,
  });
  factory TeamsIdModel.fromJsonn(Map<String, dynamic> json) {
    return TeamsIdModel(
      teamsId: List<String>.from(json["teams"] ?? []),
    );
  }
}
