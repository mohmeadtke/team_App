import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../Domain/Entity/team_entity.dart';
import '../../../Domain/Usecase/create_team.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';
part 'create_team_bloc.freezed.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  final CreateTeamUseCase createTeamUseCase;
  CreateTeamBloc({required this.createTeamUseCase}) : super(const _Initial()) {
    on<CreateTeamEvent>((event, emit) async {
      emit(const LoadingState());

      final failureOrUint = await createTeamUseCase.call(event.teamentity);

      emit(failureOrUint.fold(
          (failure) => FailureState(message: failure.toString()),
          (_) => const SuccessState()));
    });
  }
}
