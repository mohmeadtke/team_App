import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Entity/team_entity.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Repo/team_repo.dart';
import 'package:teamapp/Features/Create%20Team/data/DataSource/create_team_data_source.dart';
import 'package:teamapp/core/failure/failure.dart';
import 'package:teamapp/core/network/network_info.dart';

class TeamRepoImpl implements TeamRepo {
  // final TeamRepo teamRepo;
  final NetworkInfo networkInfo;
  final CreateTeamDataSource createTeamDataSource;
  TeamRepoImpl({required this.networkInfo, required this.createTeamDataSource});

  @override
  Future<Either<Failure, Unit>> createTeam(TeamEntity team) async {
    if (await networkInfo.isConnected) {
      try {
        // final String imageUrle = await addTeamImage.uploadImage(team);

        createTeamDataSource.createTeam(team);
        return const Right(unit);
      } catch (e) {
        return Left(Failure.serverError(massge: e.toString()));
      }
    } else {
      return const Left(Failure.offlineError());
    }
  }
}
