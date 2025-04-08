import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';
import 'package:teamapp/Features/join%20Team/Domian/Repo/join_team_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class GetTeamUsecase {
  final JoinTeamRepo joinTeamRepo;

  GetTeamUsecase({required this.joinTeamRepo});

  Future<Either<Failure, List<Jointeamentity>>> getTeamsFun(
      String teamName) async {
    return await joinTeamRepo.getTeamsData(teamName);
  }
}
