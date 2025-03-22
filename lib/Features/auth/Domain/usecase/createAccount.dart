import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/auth/Domain/repo/userRepo.dart';
import 'package:teamapp/core/failure/failure.dart';

class CreateaccountUseCase {
  final UserRepo userRepo;

  CreateaccountUseCase({required this.userRepo});

  Future<Either<Failure, Unit>> call(
      String name, String email, String passWord) async {
    return await userRepo.createAccount(name, email, passWord);
  }
}
