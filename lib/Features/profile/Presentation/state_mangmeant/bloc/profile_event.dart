part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class LoadDataEvent implements ProfileEvent {}

class UpdateDataEvent implements ProfileEvent {
  final ProfileUpdateEntity profileUpdateEntity;

  UpdateDataEvent({required this.profileUpdateEntity});
}
