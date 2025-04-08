part of 'join_team_bloc.dart';

@immutable
sealed class JoinTeamEvent {}

class SerchForTeamEvent implements JoinTeamEvent {
  final String teamName;

  SerchForTeamEvent({required this.teamName});
}

class JoinTheTeamEvent implements JoinTeamEvent {
  final String teamId;

  JoinTheTeamEvent({required this.teamId});
}
