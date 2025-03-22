import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Domian/Repo/join_team_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class GetTeamUsecase {
  final JoinTeamRepo joinTeamRepo;

  GetTeamUsecase({required this.joinTeamRepo});

  Future<Either<Failure, List>> getTeamFun(String teamName) async {
    return await joinTeamRepo.getTeamFun(teamName);
  }
}
