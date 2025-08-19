import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/auth/repo/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLogin);
    on<SignUpButtonPressed>(_onSignUp);
    on<LogoutButtonPressed>((event, emit) {
      authRepository.logout();
      emit(AuthInitial());
    });
  }

  Future<void> _onLogin(
    LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await authRepository.login(event.email, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onSignUp(
    SignUpButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      await authRepository.signUp(event.email, event.password);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
