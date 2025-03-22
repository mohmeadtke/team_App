import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.createAccountEvent({
    required String name,
    required String email,
    required String password,
  }) = CreateAccountEvent;

  const factory AuthEvent.signInEvent({
    required String email,
    required String password,
  }) = SignInEvent;

  const factory AuthEvent.signInWithGoogleEvent() = SignInWithGoogleEvent;
}
