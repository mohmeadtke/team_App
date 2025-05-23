import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

abstract class JoinTeamRepo {
  Future<Either<Failure, Unit>> joinTeamFun(String teamId);
  Future<Either<Failure, List<Jointeamentity>>> getTeamsData(String teamName);
}
