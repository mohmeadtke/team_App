import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/auth/Domain/repo/userRepo.dart';
import 'package:teamapp/core/failure/failure.dart';

class SigninwithgoogleUseCase {
  final UserRepo userRepo;

  SigninwithgoogleUseCase({required this.userRepo});

  Future<Either<Failure, Unit>> call() async {
    return await userRepo.signInWithGoogle();
  }
}
