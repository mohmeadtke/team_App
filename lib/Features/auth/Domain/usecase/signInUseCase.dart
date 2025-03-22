import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/auth/Domain/repo/userRepo.dart';
import 'package:teamapp/core/failure/failure.dart';

class SigninUseCase {
  final UserRepo userRepo;

  SigninUseCase({required this.userRepo});

  Future<Either<Failure, Unit>> call(String email, String passWord) async {
    return await userRepo.signIn(email, passWord);
  }
}
