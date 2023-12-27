import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/config/theme/theme_data.dart';
import 'package:frank_mobile/config/router/app_router.dart';
import 'package:frank_mobile/config/network/dio_manager.dart';
import 'package:frank_mobile/config/cache/auth_cache_manager.dart';
import 'package:frank_mobile/auth/domain/services/auth_service.dart';
import 'package:frank_mobile/auth/providers/auth_bloc/auth_bloc.dart';
import 'package:frank_mobile/auth/providers/login_bloc/login_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            AuthCacheManager(),
          ),
        ),
        BlocProvider(
          create: (_) => LoginBloc(
            AuthService(DioManager.instance),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Frank Mobile',
      theme: lightTheme,
    );
  }
}
