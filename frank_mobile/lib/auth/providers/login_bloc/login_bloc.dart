import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frank_mobile/utils/errors/failure.dart';
import 'package:frank_mobile/auth/domain/models/auth_model.dart';
import 'package:frank_mobile/auth/domain/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc(this.authService) : super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
    on<LoginEmailChangedEvent>(_handleLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_handleLoginPasswordChangedEvent);
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final Either<Failure, AuthModel> response;
    
      response = await authService.login(
        email: state.email,
        password: state.password,
      );
      response.fold(
      (l) => {
        //add(LogoutRequested()),
        emit(state.copyWith(message: 'No se pudo iniciar sesión', status: LoginStatus.failure)),
       // emit(const AuthState.error(error: AuthError.wrongEmailOrPassword)),
      },
      (authModel) async => {
        //await authCacheManager.updateToken(authModel.token),
        //await authCacheManager.updateLoggedIn(true),
        //emit(const AuthState.authenticated()),
      emit(state.copyWith(message: 'Success', status: LoginStatus.success)),
      },
    );
      
  }

  Future<void> _handleLoginEmailChangedEvent(
    LoginEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleLoginPasswordChangedEvent(
    LoginPasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }
}
