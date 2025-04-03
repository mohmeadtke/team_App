import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_get_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

import '../Entity/profile_update_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileGetEntity>> getData();
  Future<Either<Failure, Unit>> updateData(
      ProfileUpdateEntity profileUpdateEntity);
}
