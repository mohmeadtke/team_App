import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/join%20Team/Data/DataSource/get_team_data_source.dart';
import 'package:teamapp/Features/join%20Team/Data/DataSource/join_team_data_source.dart';
import 'package:teamapp/Features/join%20Team/Domian/Entity/join_team_entity.dart';
import 'package:teamapp/Features/join%20Team/Domian/Repo/join_team_repo.dart';
import 'package:teamapp/core/failure/failure.dart';
import 'package:teamapp/core/network/network_info.dart';

class JoinTeamRepoImpl implements JoinTeamRepo {
  final NetworkInfo networkInfo;
  final GetTeamDataSource getTeamDataSource;
  final JoinTeamDataSource joinTeamDataSource;

  JoinTeamRepoImpl(
      {required this.getTeamDataSource,
      required this.joinTeamDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List>> getTeamFun(String teamName) async {
    if (await networkInfo.isConnected) {
      try {
        List teams = await getTeamDataSource.getTeams(teamName);
        return Right(teams);
      } catch (e) {
        return Left(Failure.serverError(massge: e.toString()));
      }
    } else {
      return const Left(Failure.offlineError());
    }
  }

  @override
  Future<Either<Failure, Unit>> joinTeamFun(
      Jointeamentity jointeamentity) async {
    if (await networkInfo.isConnected) {
      try {
        joinTeamDataSource.joinTeamFun(jointeamentity);
        return const Right(unit);
      } catch (e) {
        return Left(Failure.serverError(massge: e.toString()));      
      }
    } else {
      return const Left(Failure.offlineError());
    }
  }
}
