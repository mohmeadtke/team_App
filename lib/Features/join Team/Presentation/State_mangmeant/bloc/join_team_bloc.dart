import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Domian/UseCase/get_team_usecase.dart';
import '../../../Domian/UseCase/join_team_usecase.dart';

part 'join_team_event.dart';
part 'join_team_state.dart';

class JoinTeamBloc extends Bloc<JoinTeamEvent, JoinTeamState> {
  final GetTeamUsecase getTeamUsecase;
  final JoinTeamUsecase joinTeamUsecase;
  JoinTeamBloc({required this.getTeamUsecase, required this.joinTeamUsecase})
      : super(JoinTeamInitial()) {
    on<SerchForTeamEvent>((event, emit) async {
      emit(LoadingState());

      final failureOrdata = await getTeamUsecase.getTeamsFun(event.teamName);

      emit(failureOrdata.fold(
          (failure) => FailureState(messge: failure.toString()),
          (data) => SuccessState(data: data)));
    });
    on<JoinTheTeamEvent>((event, emit) async {
      emit(LoadingState());

      final failureOrdata = await joinTeamUsecase.joinTeamFun(event.teamId);

      emit(failureOrdata.fold(
          (failure) => FailureState(messge: failure.toString()),
          (nul) => JoinSuccessState()));
    });
  }
}
