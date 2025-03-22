import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Repo/team_repo.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Usecase/create_team.dart';
import 'package:teamapp/Features/Create%20Team/Presentation/state_mangment/bloc/create_team_bloc.dart';
import 'package:teamapp/Features/Create%20Team/data/DataSource/add_team_image.dart';
import 'package:teamapp/Features/Create%20Team/data/DataSource/create_team_data_source.dart';
import 'package:teamapp/Features/Create%20Team/data/repoimpl/team_repo_impl.dart';
import 'package:teamapp/Features/auth/Presentation/state_mangment/bloc/auth_bloc.dart';
import 'package:teamapp/Features/auth/data/DataSource/createAccount.dart';
import 'package:teamapp/Features/auth/data/DataSource/signIn.dart';
import 'package:teamapp/Features/auth/data/DataSource/signInWithGoogle.dart';
import 'package:teamapp/Features/auth/data/repoimpl/user_repo_impl.dart';
import 'package:teamapp/Features/auth/Domain/repo/userRepo.dart';
import 'package:teamapp/Features/auth/Domain/usecase/createAccount.dart';
import 'package:teamapp/Features/auth/Domain/usecase/signInUseCase.dart';
import 'package:teamapp/Features/auth/Domain/usecase/signInWithGoogle.dart';
import 'package:teamapp/Features/join%20Team/Data/DataSource/get_team_data_source.dart';
import 'package:teamapp/Features/join%20Team/Data/DataSource/join_team_data_source.dart';
import 'package:teamapp/Features/join%20Team/Data/RepoImpl/join_team_repo_impl.dart';
import 'package:teamapp/Features/join%20Team/Domian/Repo/join_team_repo.dart';
import 'package:teamapp/Features/join%20Team/Domian/UseCase/get_team_usecase.dart';
import 'package:teamapp/Features/join%20Team/Domian/UseCase/join_team_usecase.dart';
import 'package:teamapp/core/network/network_info.dart';

final sl = GetIt.instance;

void init() {
//! Features
//? joinTeam
  //repo
  sl.registerLazySingleton<JoinTeamRepo>(() => JoinTeamRepoImpl(
      getTeamDataSource: sl(), joinTeamDataSource: sl(), networkInfo: sl()));
  //usecase
  sl.registerLazySingleton(() => JoinTeamUsecase(joinTeamRepo: sl()));
  sl.registerLazySingleton(() => GetTeamUsecase(joinTeamRepo: sl()));
  //data
  sl.registerFactory(() => JoinTeamDataSource());
  sl.registerFactory(() => GetTeamDataSource());
//?Create a team
  //repo
  sl.registerLazySingleton<TeamRepo>(() => TeamRepoImpl(
      networkInfo: sl(), addTeamImage: sl(), createTeamDataSource: sl()));
  //useCase
  sl.registerLazySingleton(() => CreateTeamUseCase(teamRepo: sl()));
  //data
  sl.registerFactory(() => AddTeamImage());
  sl.registerFactory(() => CreateTeamDataSource());
  //bloc
  sl.registerFactory(() => CreateTeamBloc(createTeamUseCase: sl()));
//?auth
  //bloc
  sl.registerFactory(() => AuthBloc(
      createaccountUseCase: sl(),
      signinUseCase: sl(),
      signinwithgoogleUseCase: sl()));
  //useCase
  sl.registerLazySingleton(() => CreateaccountUseCase(userRepo: sl()));
  sl.registerLazySingleton(() => SigninUseCase(userRepo: sl()));
  sl.registerLazySingleton(() => SigninwithgoogleUseCase(userRepo: sl()));
  //repo
  sl.registerLazySingleton<UserRepo>(() => UserRepoImpl(
      networkInfo: sl(),
      createAccountClass: sl(),
      signInClass: sl(),
      signInWithGoogleClass: sl()));
  //data
  sl.registerFactory(() => CreateAccount());
  sl.registerFactory(() => SignIn());
  sl.registerFactory(() => SignInWithGoogle());
  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnection());
}
