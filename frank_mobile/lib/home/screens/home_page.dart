import 'package:flutter/material.dart';

import 'package:frank_mobile/widgets/appbar_widget.dart';
import 'package:frank_mobile/widgets/drawer_widget.dart';
import 'package:frank_mobile/home/widgets/module_card_widget.dart';

class HomePage extends StatelessWidget {
  static const String name = 'home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        drawer: const DrawerWidget(),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo_orange.png',
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 72,
                  fit: BoxFit.contain,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 15),
                child: Text(
                  'Please select the module you want to access',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Color(0xFFFF6537),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ModuleCardWidget(
                        label: 'TRAVELLERS',
                        image: 'https://picsum.photos/seed/321/600',
                        onTap: () {},
                        //=> context.goNamed(TravellersPage.name)),
                    ),
                    ModuleCardWidget(
                        label: 'TIME TRACKING',
                        image: 'https://picsum.photos/seed/321/600',
                        onTap: () {},
                        //=> context.goNamed(TravellersPage.name)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
