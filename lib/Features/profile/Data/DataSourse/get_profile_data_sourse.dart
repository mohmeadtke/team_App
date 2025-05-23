import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/core/localDataSaved/user_data_local_storge.dart';

import '../model/data_modle.dart';

class GetProfileDataSourse {
  Future<ProfileGetEntity> getData() async {
    final data = await UserDataCache().getCachedUserData();
    return ProfileModel.fromJsonn(data!);
  }
}
