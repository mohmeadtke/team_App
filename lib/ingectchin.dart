import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Repo/team_repo.dart';
import 'package:teamapp/Features/Create%20Team/Domain/Usecase/create_team.dart';
import 'package:teamapp/Features/Create%20Team/Presentation/state_mangment/bloc/create_team_bloc.dart';
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
import 'package:teamapp/Features/join%20Team/Presentation/State_mangmeant/bloc/join_team_bloc.dart';
import 'package:teamapp/Features/main/Data/DataSourse/check_user_have_team_data_source.dart';
import 'package:teamapp/Features/main/Data/DataSourse/get_data_of_team_data_source.dart';
import 'package:teamapp/Features/main/Data/RepoImpl/profile_repo_impl.dart';
import 'package:teamapp/Features/main/Domain/Repo/main_page_repo.dart';
import 'package:teamapp/Features/main/Domain/UseCase/check_user_have_team_usecase.dart';
import 'package:teamapp/Features/main/Domain/UseCase/get_data_of_team_usecase.dart';
import 'package:teamapp/Features/main/Presentation/state_mangmeant/bloc/main_page_bloc.dart';
import 'package:teamapp/Features/profile/Data/DataSourse/get_profile_data_sourse.dart';
import 'package:teamapp/Features/profile/Data/DataSourse/update_profile_data.dart';
import 'package:teamapp/Features/profile/Data/RepoImpl/profile_repo_impl.dart';
import 'package:teamapp/Features/profile/Domain/Repo/profile_repo.dart';
import 'package:teamapp/Features/profile/Domain/UseCase/get_profile_data_usecase.dart';
import 'package:teamapp/Features/profile/Domain/UseCase/update_profile_usecase.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';
import 'package:teamapp/core/network/network_info.dart';
import 'package:teamapp/core/widget/globl.dart';

final sl = GetIt.instance;

void init() {
//! Features
//? Main page
  //repo
  sl.registerLazySingleton<MainPageRepo>(() => MainPageRepoImpl(
        networkInfo: sl(),
        checkUserHaveTeamDataSource: sl(),
        getDataOfTeamDataSource: sl(),
      ));
  //use case
  sl.registerLazySingleton(() => CheckUserHaveTeamUsecase(mainPageRepo: sl()));
  sl.registerLazySingleton(() => GetDataOfTeamUsecase(mainPageRepo: sl()));
  //data
  sl.registerFactory(() => CheckUserHaveTeamDataSource());
  sl.registerFactory(() => GetDataOfTeamDataSource());
  //bloc
  sl.registerFactory(() =>
      MainPageBloc(checkUserHaveTeamUsecase: sl(), getDataOfTeamUsecase: sl()));

//? profile page
//repo
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        getProfileDataSourse: sl(),
        networkInfo: sl(),
        updateProfileData: sl(),
      ));
//use case
  sl.registerLazySingleton(() => GetProfileDataUsecase(profileRepo: sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(profileRepo: sl()));
//data
  sl.registerFactory(() => GetProfileDataSourse());
  sl.registerFactory(() => UpdateProfileData());
  // sl.registerLazySingleton(() =>
  //     ProfileModel(imageurl: sl(), name: sl(), email: sl(), password: sl()));
//bloc
  sl.registerFactory(() =>
      ProfileBloc(getProfileDataUsecase: sl(), updateProfileUsecase: sl()));

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
  //bloc
  sl.registerFactory(
      () => JoinTeamBloc(getTeamUsecase: sl(), joinTeamUsecase: sl()));
//?Create a team
  //repo
  sl.registerLazySingleton<TeamRepo>(
      () => TeamRepoImpl(networkInfo: sl(), createTeamDataSource: sl()));
  //useCase
  sl.registerLazySingleton(() => CreateTeamUseCase(teamRepo: sl()));
  //data
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
  sl.registerSingleton<Globals>(Globals());

  // sl.registerLazySingleton(
  //     () => ProfileGetEntity(imageurl: '', name: '', email: '', password: ''));
}
