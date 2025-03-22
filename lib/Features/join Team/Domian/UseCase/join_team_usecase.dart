import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';
import 'package:teamapp/Features/join%20Team/Domian/Repo/join_team_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class JoinTeamUsecase {
  final JoinTeamRepo joinTeamRepo;

  JoinTeamUsecase({required this.joinTeamRepo});

  Future<Either<Failure, Unit>> joinTeamFun(
      Jointeamentity jointeamentity) async {
    return await joinTeamRepo.joinTeamFun(jointeamentity);
  }
}
