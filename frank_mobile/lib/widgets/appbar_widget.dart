import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

 @override
 Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      /*leading: IconButton(
        icon: const Icon(Icons.menu, size: 32),
        onPressed: (){},
      ),*/
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 32,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_2_outlined,
            size: 32,
          ),
        ),
      ],
    );
  }
}
