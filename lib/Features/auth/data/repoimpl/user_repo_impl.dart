import 'package:dartz/dartz.dart';
import 'package:teamapp/Features/auth/data/DataSource/createAccount.dart';
import 'package:teamapp/Features/auth/data/DataSource/signIn.dart';
import 'package:teamapp/Features/auth/data/DataSource/signInWithGoogle.dart';
import 'package:teamapp/Features/auth/Domain/repo/userRepo.dart';
import 'package:teamapp/core/failure/failure.dart';
import 'package:teamapp/core/network/network_info.dart';

class UserRepoImpl implements UserRepo {
  final CreateAccount createAccountClass;
  final NetworkInfo networkInfo;
  final SignIn signInClass;
  final SignInWithGoogle signInWithGoogleClass;

  UserRepoImpl({
    required this.networkInfo,
    required this.createAccountClass,
    required this.signInClass,
    required this.signInWithGoogleClass,
  });

  @override
  Future<Either<Failure, Unit>> createAccount(
      String name, String email, String password) async {
    return await _performNetworkCheck(() async {
      await createAccountClass.createAccount(name, email, password);
    });
  }

  @override
  Future<Either<Failure, Unit>> signIn(String email, String password) async {
    return await _performNetworkCheck(() async {
      await signInClass.signIn(email, password);
    });
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    return await _performNetworkCheck(() async {
      await signInWithGoogleClass.signInWithGoogle();
    });
  }

  Future<Either<Failure, Unit>> _performNetworkCheck(
      Future<void> Function() action) async {
    if (await networkInfo.isConnected) {
      try {
        await action();
        return const Right(unit);
      } catch (e) {
        print(e);

        return Left(Failure.serverError(massge: e.toString()));
      }
    } else {
      return const Left(Failure.offlineError());
    }
  }
}
