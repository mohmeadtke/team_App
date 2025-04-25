import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/main/Domain/Entity/main-page_entity.dart';
import 'package:teamapp/core/failure/failure.dart';

abstract class MainPageRepo {
  Future<Either<Failure, Unit>> checkUserHaveTeam();
  Future<Either<Failure, MainPageEntity>> getDatOfTeam();
}
