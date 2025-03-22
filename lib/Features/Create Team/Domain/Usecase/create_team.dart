import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Repo/team_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class CreateTeamUseCase {
  final TeamRepo teamRepo;

  CreateTeamUseCase({required this.teamRepo});

  Future<Either<Failure, Unit>> call(TeamEntity team) async {
    return await teamRepo.createTeam(team);
  }
}
