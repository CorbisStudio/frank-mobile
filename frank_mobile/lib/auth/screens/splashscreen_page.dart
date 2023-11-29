import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frank_mobile/home/screens/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'package:frank_mobile/config/router/pages.dart';
import 'package:frank_mobile/auth/providers/bloc/auth_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;
  late AuthStatus status;

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.orange,
      onInit: () {
        authBloc = context.read<AuthBloc>()..add(AppStarted());
        authStream = authBloc.stream.listen((state) {
          status = state.status;
        });
      },
      onEnd: () {
        switch (status) {
          case AuthStatus.authenticated:
            context.goNamed(HomePage.name);
          case AuthStatus.guest:
            context.goNamed(LoginPage.name);
          case AuthStatus.unknown:
            context.goNamed(LoginPage.name);
        }
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/images/logo_white.png"),
      ),
    );
  }

  @override
  void dispose() {
    authStream.cancel();
    super.dispose();
  }
}
