import 'dart:io';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/auth/domain/models/auth_model.dart';
import 'package:frank_mobile/config/cache/auth_cache_manager.dart';
import 'package:frank_mobile/auth/domain/services/interface_auth_service.dart';
import 'package:frank_mobile/utils/errors/failure.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthCacheManager authCacheManager;
  final IAuthService authService;

  AuthBloc(this.authService, this.authCacheManager)
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
              : const AuthState.unauthenticated(),
        );
      }
    } on SocketException {
      emit(const AuthState.error(error: AuthError.hostUnreachable));
    } catch (e) {
      log(e.toString());
      emit(const AuthState.error());
    }
  }

  Future<void> _login(event, emit) async {

    final Either<Failure, AuthModel> response = await authService.login(
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
        //await authCacheManager.updateToken(authModel.token),
        //await authCacheManager.updateLoggedIn(true),
        emit(const AuthState.authenticated()),
      },
    );
  }

  Future<void> _signOut(event, emit) async {
    try {
      await authCacheManager.signOut();
      emit(const AuthState.unauthenticated());
    } catch (_) {}
  }
}
