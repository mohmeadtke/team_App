part of 'create_team_bloc.dart';

@freezed
class CreateTeamState with _$CreateTeamState {
  const factory CreateTeamState.initial() = _Initial;
  const factory CreateTeamState.loading() = LoadingState;
  const factory CreateTeamState.success() = SuccessState; // Replacing PassState
  const factory CreateTeamState.failure({required String message}) =
      FailureState;
}
