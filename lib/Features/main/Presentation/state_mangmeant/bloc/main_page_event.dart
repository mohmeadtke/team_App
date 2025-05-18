part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent {}

class CheckIfUserHaveTeam extends MainPageEvent {}

class GetTeamsData extends MainPageEvent {
  final List<String> teamsId;
  GetTeamsData({required this.teamsId});
}
