import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

abstract class MainPageRepo {
  Future<Either<Failure, List<String>>> checkUserHaveTeam();
  Future<Either<Failure, List<TeamsEntity>>> getDatOfTeams(List<String> teamId);
}
