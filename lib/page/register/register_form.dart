import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_demo/config/my_const.dart';
import 'package:login_demo/sql/db_helper.dart';
import 'package:login_demo/util/navigator_util.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController accountController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  Widget _getInput(
      {@required String hintText,
      @required TextEditingController textEditingController,
      @required Icon prefixIcon,
      bool obscureText = false}) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(800.0),
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(80.0)),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        autofocus: false,
        style: TextStyle(color: Colors.white, fontSize: 19.0),
        decoration: InputDecoration(hintText: hintText, prefixIcon: prefixIcon),
      ),
    );
  }

  Future<int> _register() {
    User user = User();
    user.account = accountController.text;
    user.password = passwordController.text;
    user.name = nameController.text;
    user.email = emailController.text;
    return DBProvider.instance.insert(user);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getInput(
            hintText: 'account',
            textEditingController: accountController,
            prefixIcon: Icon(
              Icons.person,
              size: 28.0,
            ),
          ),
          _getInput(
              hintText: 'password',
              textEditingController: passwordController,
              prefixIcon: Icon(
                Icons.lock,
                size: 28.0,
              ),
              obscureText: true),
          _getInput(
            hintText: 'name',
            textEditingController: nameController,
            prefixIcon: Icon(
              Icons.person_outline,
              size: 28.0,
            ),
          ),
          _getInput(
            hintText: 'email',
            textEditingController: emailController,
            prefixIcon: Icon(
              Icons.email,
              size: 28.0,
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(150)),
            width: ScreenUtil.getInstance().setWidth(800),
            height: ScreenUtil.getInstance().setHeight(180),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.yellow[500],
              onPressed: () async {
                if (accountController.text == '' || passwordController.text == ''
                    || nameController.text == '' || emailController.text == '') {
                  Fluttertoast.showToast(
                    msg: "please complete information",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.redAccent,
                  );
                }
                try {
                  await _register();
                } on Exception catch (e){
                  print(e.toString());
                  Fluttertoast.showToast(
                    msg: "register fail",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.redAccent,
                  );
                  return;
                }
                Fluttertoast.showToast(
                  msg: "register success",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.green,
                );
                NavigatorUtil.toLoginPage(context);
              },
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28.0,
                    letterSpacing: 8.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: MyConst.LOBSTER_FONT_FAMILY),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
