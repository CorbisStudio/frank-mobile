import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'package:frank_mobile/config/router/pages.dart';
import 'package:frank_mobile/auth/providers/auth_bloc/auth_bloc.dart';


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
          Future.delayed(const Duration(seconds: 2)).then((_) {
            switch (state.status) {
              case AuthStatus.authenticated:
                context.goNamed(HomePage.name);
              case AuthStatus.unauthenticated:
                context.goNamed(LoginPage.name);
              case AuthStatus.unknown:
                context.goNamed(LoginPage.name);
            }
          });
        });
      },
      onEnd: () { },
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
