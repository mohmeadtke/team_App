import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure, ProfileGetEntity>> getData() {
    // TODO: implement getDatap
    //to do
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileUpdateEntity>> updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
