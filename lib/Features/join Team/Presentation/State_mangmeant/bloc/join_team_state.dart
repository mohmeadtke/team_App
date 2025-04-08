part of 'join_team_bloc.dart';

@immutable
sealed class JoinTeamState {}

final class JoinTeamInitial extends JoinTeamState {}

class LoadingState implements JoinTeamState {}

class JoinSuccessState implements JoinTeamState {}

class SuccessState implements JoinTeamState {
  final dynamic data;

  SuccessState({required this.data});
}

class FailureState implements JoinTeamState {
  final String messge;
  FailureState({required this.messge});
}
