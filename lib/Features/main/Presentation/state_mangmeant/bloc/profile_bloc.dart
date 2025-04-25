import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teamapp/Features/profile/Domain/Entity/profile_update_entity.dart';
import 'package:teamapp/Features/profile/Domain/UseCase/update_profile_usecase.dart';

import '../../../Domain/UseCase/check_user_have_team_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDataUsecase getProfileDataUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  ProfileBloc(
      {required this.updateProfileUsecase, required this.getProfileDataUsecase})
      : super(ProfileInitial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingState());

      final failureOrdata = await getProfileDataUsecase.call();

      emit(failureOrdata.fold(
          (failure) => FailureState(messge: failure.toString()),
          (data) => SuccessState(data: data)));
    });

    on<UpdateDataEvent>((event, emit) async {
      emit(LoadingState());

      await updateProfileUsecase.call(event.profileUpdateEntity);

      final failureOrdata = await getProfileDataUsecase.call();

      emit(failureOrdata.fold(
          (failure) => FailureState(messge: failure.toString()),
          (data) => SuccessState(data: data)));
    });
  }
}
