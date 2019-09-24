import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/router/router_handler.dart';

class Routes {
  static String login = '/';
  static String register = '/register';
  static String home = '/home';


  static void configureRoutes(Router router) {

    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return  null;
        });
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler, transitionType: TransitionType.cupertino);
    router.define(home, handler: homeHandler, transitionType: TransitionType.cupertino);
  }
}