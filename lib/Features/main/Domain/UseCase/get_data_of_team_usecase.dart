import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';
import 'package:teamapp/Features/main/Domain/Repo/main_page_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class GetDataOfTeamUsecase {
  final MainPageRepo mainPageRepo;

  GetDataOfTeamUsecase({required this.mainPageRepo});

  Future<Either<Failure, List<TeamsEntity>>> call(List<String> teamId) async {
    return await mainPageRepo.getDatOfTeams(teamId);
  }
}
