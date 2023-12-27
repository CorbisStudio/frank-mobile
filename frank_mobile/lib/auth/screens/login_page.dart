import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/utils/validations.dart';
import 'package:frank_mobile/config/router/pages.dart';
import 'package:frank_mobile/config/router/widgets.dart';
import 'package:frank_mobile/auth/providers/auth_bloc/auth_bloc.dart';
import 'package:frank_mobile/auth/providers/login_bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  static const String name = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? get validate => _formKey.currentState?.validate();

  @override
  void initState() {
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
    super.initState();
  }

  @override
  void dispose() {
    authStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(
        'We don-t recognize this e-mail or password.\nCheck your information and try again.',
      ),
    );

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            () => context.goNamed('home_page');
          }
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Image.asset(
                      'assets/images/logo_orange.png',
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 72,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Text(
                      'Please enter your Frank credentials to login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 75),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: OutlinedTextField(
                        labelText: 'Username',
                        hintText: '@corbisstudio.com',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) =>
                            Validations.emailValidation(value),
                        controller: emailController,
                        onChanged: (value) {
                          emailController.text = value;
                          context
                              .read<LoginBloc>()
                              .add(LoginEmailChangedEvent(email: value));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: OutlinedTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        hintText: 'xxxxxxx',
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) =>
                            Validations.normalValidation(value),
                        obscureText: true,
                        onChanged: (value) {
                          passwordController.text = value;
                          context.read<LoginBloc>().add(
                                LoginPasswordChangedEvent(password: value),
                              );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(50),
                    child: FlatButtonWidget(
                      onPressed: () {
                        if (validate != null && validate == true) {
                          context.read<LoginBloc>().add(
                                const LoginButtonPressedEvent(),
                              );
                        }
                      },
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      minimumSize: const Size(92, 48),
                      elevation: 0,
                      label: 'Login',
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Did you forget your password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFC1C1C1),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Do you need more help?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFC1C1C1),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
