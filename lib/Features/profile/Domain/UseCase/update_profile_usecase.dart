import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

import '../Entity/profile_update_entity.dart';

class UpdateProfileUsecase {
  final ProfileRepo profileRepo;

  UpdateProfileUsecase({required this.profileRepo});

  Future<Either<Failure, Unit>> call(
      ProfileUpdateEntity profileUpdateEntity) async {
    return await profileRepo.updateData(profileUpdateEntity);
  }
}
