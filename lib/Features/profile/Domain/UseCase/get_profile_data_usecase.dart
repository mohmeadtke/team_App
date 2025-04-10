import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class GetProfileDataUsecase {
  final ProfileRepo profileRepo;

  GetProfileDataUsecase({required this.profileRepo});

  Future<Either<Failure, ProfileGetEntity>> call() async {
    return await profileRepo.getData();
  }
}
