import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/main/Data/DataSourse/get_data_of_team_data_source.dart';
import 'package:teamapp/Features/main/Domain/Entity/teams_entity.dart';
import 'package:teamapp/Features/main/Domain/Repo/main_page_repo.dart';
import 'package:teamapp/Features/profile/Data/DataSourse/update_profile_data.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';
import 'package:teamapp/core/network/network_info.dart';

import '../DataSourse/check_user_have_team_data_source.dart';

class MainPageRepoImpl implements MainPageRepo {
  final NetworkInfo networkInfo;
  final CheckUserHaveTeamDataSource checkUserHaveTeamDataSource;
  final GetDataOfTeamDataSource getDataOfTeamDataSource;
  // final ProfileGetEntity profileGetEntity;
  MainPageRepoImpl(
      {required this.networkInfo,
      required this.checkUserHaveTeamDataSource,
      required this.getDataOfTeamDataSource});

  @override
  Future<Either<Failure, List<String>>> checkUserHaveTeam() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await checkUserHaveTeamDataSource.checkFun());
      } else {
        return left(const Failure.offlineError());
      }
    } catch (e) {
      return left(Failure.serverError(massge: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TeamsEntity>>> getDatOfTeams(
      List<String> teamId) async {
    try {
      if (await networkInfo.isConnected) {
        print("teamId from impl repo: $teamId");
        final teams = await getDataOfTeamDataSource.getTeamData(teamId);
        print("teams : $teams");
        return Right(teams);
      } else {
        return left(const Failure.offlineError());
      }
    } catch (e) {
      return left(Failure.serverError(massge: e.toString()));
    }
  }
}
