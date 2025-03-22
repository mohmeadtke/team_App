import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

abstract class TeamRepo {
  Future<Either<Failure, Unit>> createTeam(TeamEntity team);
}
