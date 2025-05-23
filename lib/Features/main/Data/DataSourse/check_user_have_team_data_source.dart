import 'package:teamapp/Features/main/Data/model/teams_id_model.dart';
import '../../../../core/localDataSaved/user_data_local_storge.dart';

class CheckUserHaveTeamDataSource {
  Future<List<String>> checkFun() async {
    final data = await UserDataCache().getCachedUserData();

    var userData = TeamsIdModel.fromJsonn(data!);

    print("userData : ${userData}");
    return userData.teamsId;
  }
}
