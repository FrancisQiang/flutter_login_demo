import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/page/login/login_page.dart';
import 'package:login_demo/router/application.dart';
import 'package:login_demo/router/routes.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.cyan
      ),
      onGenerateRoute: Application.router.generator,
      home: LoginPage(),
    );
  }
}
