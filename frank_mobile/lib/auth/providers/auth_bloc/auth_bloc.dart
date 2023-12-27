import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/config/cache/auth_cache_manager.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthCacheManager authCacheManager;

  AuthBloc(this.authCacheManager)
      : super(const AuthState.unknown()) {
    on<AppStarted>(_appStarted);
    on<LoginRequested>(_login);
    on<LogoutRequested>(_signOut);
  }

  Future<void> _appStarted(event, emit) async {
    try {
      if (await authCacheManager.isLoggedIn()) {
        await authCacheManager.updateTokenFromStorage();
        emit(const AuthState.authenticated());
      } else {
        emit(
          (await authCacheManager.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest(),
        );
      }
    } on SocketException {
      emit(const AuthState.error(error: AuthError.hostUnreachable));
    } catch (e) {
      emit(const AuthState.error());
    }
  }

  Future<void> _login(event, emit) async {
    /*final Either<Failure, AuthModel> response = await authService.login(
      email: event.email,
      password: event.password,
    );
    response.fold(
      (l) => {
        log('wrongEmailOrPassword'),
        add(LogoutRequested()),
        emit(const AuthState.error(error: AuthError.wrongEmailOrPassword)),
      },
      (authModel) async => {
        await authCacheManager.updateToken(authModel.token),
        await authCacheManager.updateLoggedIn(true),
        emit(const AuthState.authenticated()),
      },
    );*/
  }

  Future<void> _signOut(event, emit) async {
    try {
      await authCacheManager.signOut();
      emit(const AuthState.guest());
    } catch (_) {}
  }
}



  /*

  AuthBloc(this.authService, this.authCacheManager)
      : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authCacheManager.isLoggedIn()) {
          await authCacheManager.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit(
            (await authCacheManager.isFirstEntry())
                ? const AuthState.firstEntry()
                : const AuthState.guest(),
          );
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        final AuthModel response = await authService.login(
          email: event.email,
          password: event.password,
        );
        if (response.token != null) {
          await authCacheManager.updateToken(response.token);
          await authCacheManager.updateLoggedIn(true);
          emit(const AuthState.authenticated());
        } else {
          log('wrongEmailOrPassword');
          add(LogoutRequested());
          emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
        }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authCacheManager.signOut();
        emit(const AuthState.guest());
      } catch (_) {}
    });
  }
}
*/