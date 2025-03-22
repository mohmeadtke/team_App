import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class UpdateProfileUsecase {
  final ProfileRepo profileRepo;

  UpdateProfileUsecase({required this.profileRepo});

  Future<Either<Failure, ProfileUpdateEntity>> updateData() async {
    return await profileRepo.updateData();
  }
}
