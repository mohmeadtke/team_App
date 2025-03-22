import 'package:bloc/bloc.dart';
import '../../../Domain/usecase/createAccount.dart';
import '../../../Domain/usecase/signInUseCase.dart';
import '../../../Domain/usecase/signInWithGoogle.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateaccountUseCase createaccountUseCase;
  final SigninUseCase signinUseCase;
  final SigninwithgoogleUseCase signinwithgoogleUseCase;

  AuthBloc(
      {required this.createaccountUseCase,
      required this.signinUseCase,
      required this.signinwithgoogleUseCase})
      : super(const InitialState()) {
    on<CreateAccountEvent>((event, emit) async {
      emit(const LoadingState());

      final failureOrUint = await createaccountUseCase.call(
          event.name, event.email, event.password);

      emit(failureOrUint.fold(
          (failure) => FailureState(message: failure.toString()),
          (_) => const SuccessState()));
    });

    on<SignInEvent>((event, emit) async {
      emit(const LoadingState());

      final failureOrUint =
          await signinUseCase.call(event.email, event.password);

      emit(failureOrUint.fold(
          (failure) => FailureState(message: failure.toString()),
          (_) => const SuccessState()));
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(const LoadingState());
      final failureOrUint = await signinwithgoogleUseCase.call();
      emit(failureOrUint.fold(
          (failure) => FailureState(message: failure.toString()),
          (_) => const SuccessState()));
    });
  }
}
