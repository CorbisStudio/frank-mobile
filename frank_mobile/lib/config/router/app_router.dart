import 'package:frank_mobile/home/screens/home_page.dart';
import 'package:go_router/go_router.dart';

import 'package:frank_mobile/config/router/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: '/login',
      name: LoginPage.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
