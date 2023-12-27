import 'package:flutter/material.dart';
import 'package:frank_mobile/auth/providers/auth_bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frank_mobile/config/router/pages.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 48, 24, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: Color(0xFF6E6D6F),
                      size: 40,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nerina Bellencin',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'nerina.bellencin@corbisstudio.com',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFFE9ECEA),
          ),
          ListTile(
            onTap: () {
              context.read<AuthBloc>().add(LogoutRequested());
              context.goNamed(LoginPage.name);


            },
            title: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
