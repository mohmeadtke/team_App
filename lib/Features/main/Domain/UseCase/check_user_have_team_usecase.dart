import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/main/Domain/Repo/main_page_repo.dart';
import 'package:teamapp/core/failure/failure.dart';

class CheckUserHaveTeamUsecase {
  final MainPageRepo mainPageRepo;

  CheckUserHaveTeamUsecase({required this.mainPageRepo});

  Future<Either<Failure, Unit>> call() async {
    return await mainPageRepo.checkUserHaveTeam();
  }
}
