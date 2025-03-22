part of 'create_team_bloc.dart';

@freezed
class CreateTeamEvent with _$CreateTeamEvent {
  const factory CreateTeamEvent.create({required TeamEntity teamentity}) =
      _Create;
}
