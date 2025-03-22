import 'package:dartz/dartz.dart';
import 'package:teamapp/core/failure/failure.dart';

abstract class UserRepo {

  Future<Either<Failure,Unit>> signIn(String email,String passWord);

  Future<Either<Failure,Unit>> createAccount(String name ,String email,String passWord);

  Future<Either<Failure,Unit>> signInWithGoogle();
}