part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

enum AuthError {
  hostUnreachable,
  unknown,
  wrongEmailOrPassword,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isFirstEntry;
  final AuthError? error;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.isFirstEntry = true,
    this.error,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
          isFirstEntry: false,
        );

  const AuthState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
          isFirstEntry: false,
        );

  const AuthState.firstEntry() : this._(status: AuthStatus.unauthenticated);

  const AuthState.error({AuthError error = AuthError.unknown})
      : this._(status: AuthStatus.unknown, isFirstEntry: false, error: error);

  @override
  List<Object?> get props => [status, isFirstEntry, error];
}
