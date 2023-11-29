import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/utils/validations.dart';
import 'package:frank_mobile/config/router/widgets.dart';
import 'package:frank_mobile/auth/providers/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  static const String name = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? get validate => _formKey.currentState?.validate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Image.asset(
                    'assets/images/logo_orange.png',
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 72,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
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
                      validator: (value) => Validations.emailValidation(value),
                      controller: emailController,
                      onChanged: (String value) {
                        emailController.text = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: OutlinedTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      hintText: 'xxxxxxx',
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) => Validations.normalValidation(value),
                      onChanged: (String value) {
                        passwordController.text = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(50),
                  child: FlatButtonWidget(
                    onPressed: () {
                      if (validate != null && validate == true) {
                        context.read<AuthBloc>().add(
                              LoginRequested(
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                        // () => context.goNamed('home_page'),
                        //TODO manejar inicio de sesión correcto /incorrecto
                      }
                    },
                    backgroundColor: Colors.orange,
                    textColor: Colors.white,
                    minimumSize: const Size(92, 48),
                    elevation: 0,
                    label: 'Login',
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                    child: Text(
                      'Did you forget your password? \nDo you need more help?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC1C1C1),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
