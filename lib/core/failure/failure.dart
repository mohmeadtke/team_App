import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError({required String massge}) = ServerError;
  const factory Failure.offlineError() = OfflineError;
  const factory Failure.invalidData() = InvalidData;
  const factory Failure.wrongPassword({required String massge}) = WrongPassword;
}
