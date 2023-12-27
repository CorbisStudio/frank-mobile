import 'package:flutter/material.dart';
import 'package:frank_mobile/auth/providers/auth_bloc/auth_bloc.dart';

import 'package:frank_mobile/config/router/pages.dart';


extension NavigateExtension on AuthStatus {
  Widget get firstView {
    switch (this) {
      case AuthStatus.authenticated:
        return const HomePage();
      case AuthStatus.unauthenticated:
        return const LoginPage();
      case AuthStatus.unknown:
        break;
    }
    return const LoginPage();
  }
}
