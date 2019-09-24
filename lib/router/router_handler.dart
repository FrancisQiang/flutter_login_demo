import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/page/home/home_page.dart';
import 'package:login_demo/page/login/login_page.dart';
import 'package:login_demo/page/register/register_page.dart';

var  loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  },
);

var registerHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RegisterPage();
  },
);

var homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['name']?.first;
    var email = params['email']?.first;
    return HomePage(
      name: name,
      email: email
    );
  },
);


