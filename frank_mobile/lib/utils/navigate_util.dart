import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigateUtil {
  void navigateToView(BuildContext context, String routeName) {
    context.goNamed(routeName);
  }
}


