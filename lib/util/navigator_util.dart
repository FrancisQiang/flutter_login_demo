import 'package:flutter/material.dart';
import 'package:login_demo/router/application.dart';
import 'package:login_demo/router/routes.dart';

class NavigatorUtil {
  static void toLoginPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.login, replace: true);
  }

  static void toRegisterPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.register);
  }

  static void toHomePage(BuildContext context,
      {String name, String email}) {
    Application.router.navigateTo(context, Routes.home + "?name=$name&email=$email", replace: true);
  }
}
