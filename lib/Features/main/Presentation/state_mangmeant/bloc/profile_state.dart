part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class LoadingState implements ProfileState {}

class SuccessState implements ProfileState {
  final dynamic data;

  SuccessState({required this.data});
}

class FailureState implements ProfileState {
  final String messge;
  FailureState({required this.messge});
}
