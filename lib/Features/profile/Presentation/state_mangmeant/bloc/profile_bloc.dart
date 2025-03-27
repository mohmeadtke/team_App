import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Domain/UseCase/get_profile_data_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDataUsecase getProfileDataUsecase;

  ProfileBloc({required this.getProfileDataUsecase}) : super(ProfileInitial()) {
    // print("helowwwwwwwwwwwwww");

    on<LoadDataEvent>((event, emit) async {
      emit(LoadingState());
      // print("dddddddddddddddddddddddd");

      final failureOrdata = await getProfileDataUsecase.call();

      emit(failureOrdata.fold(
          (failure) => FailureState(messge: failure.toString()),
          (data) => SuccessState(data: data)));
    });
  }
}
