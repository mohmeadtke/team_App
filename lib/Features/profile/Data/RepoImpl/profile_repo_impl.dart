import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Data/DataSourse/update_profile_data.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';
import 'package:teamapp/core/network/network_info.dart';

import '../DataSourse/get_profile_data_sourse.dart';

class ProfileRepoImpl implements ProfileRepo {
  final NetworkInfo networkInfo;
  final GetProfileDataSourse getProfileDataSourse;
  final UpdateProfileData updateProfileData;
  // final ProfileGetEntity profileGetEntity;
  ProfileRepoImpl(
      {required this.updateProfileData,
      // required this.profileGetEntity,
      required this.getProfileDataSourse,
      required this.networkInfo});
  @override
  Future<Either<Failure, ProfileGetEntity>> getData() async {
    try {
      if (await networkInfo.isConnected == true) {
        return right(await getProfileDataSourse.getData());
      } else {
        return left(const Failure.offlineError());
      }
    } catch (e) {
      return left(Failure.serverError(massge: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateData(
      ProfileUpdateEntity profileUpdateEntity) async {
    try {
      if (await networkInfo.isConnected == true) {
        return right(await updateProfileData.call(profileUpdateEntity));
      } else {
        return left(const Failure.offlineError());
      }
    } catch (e) {
      return left(Failure.serverError(massge: e.toString()));
    }
  }
}
