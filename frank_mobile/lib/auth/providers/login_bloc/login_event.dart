part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent();
}

class EmailChangedEvent extends LoginEvent {
  const EmailChangedEvent({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  const PasswordChangedEvent({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}
