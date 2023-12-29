import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_emailChangedHandler);
    on<PasswordChangedEvent>(_passwordChangedHandler);
    on<LoginButtonPressedEvent>(_loginHandler);
  }

  Future<void> _loginHandler(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
  }

  Future<void> _emailChangedHandler(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _passwordChangedHandler(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }
}
