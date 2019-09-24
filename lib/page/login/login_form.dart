import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_demo/config/my_const.dart';
import 'package:login_demo/sql/db_helper.dart';
import 'package:login_demo/util/navigator_util.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController accountController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    passwordController = TextEditingController();
  }


  Widget _getGradientIcon(context, {Icon icon}) {
    return Container(
      height: ScreenUtil.getInstance().setWidth(150.0),
      width: ScreenUtil.getInstance().setWidth(150.0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.cyan,
            Colors.deepPurple,
            Colors.indigoAccent,
          ])),
      child: IconButton(
        onPressed: () {},
        icon: icon == null ? Icon(Icons.clear) : icon,
        color: Colors.white70,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setWidth(60.0)),
      child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(100.0)),
            child: TextField(
              controller: accountController,
              style: TextStyle(color: Colors.white70, fontSize: 19.0),
              decoration: InputDecoration(
                  hintText: 'username',
                  prefixIcon: Icon(
                    Icons.person,
                    size: 28.0,
                  )),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(100.0)),
            child: TextField(
              controller: passwordController,
              autofocus: false,
              obscureText: true,
              style: TextStyle(color: Colors.white, fontSize: 19.0),
              decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 28.0,
                  )),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(180)),
            width: ScreenUtil.getInstance().setWidth(700),
            height: ScreenUtil.getInstance().setHeight(180),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              onPressed: () async {
                LoginUserVO user = await DBProvider.instance.login(accountController.text, passwordController.text);
                if (user != null) {
                  NavigatorUtil.toHomePage(context, name: user.name, email: user.email);
                } else {
                  Fluttertoast.showToast(
                      msg: "login fail",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.redAccent,
                  );
                }
              },
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 28.0,
                    letterSpacing: 8.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: MyConst.LOBSTER_FONT_FAMILY),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
            child: FlatButton(
              onPressed: () {
                NavigatorUtil.toRegisterPage(context);
              },
              child: Text(
                'have no account ?',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.0,
                  letterSpacing: 1.2,
                  fontFamily: 'lobster',
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _getGradientIcon(context, icon: Icon(FontAwesomeIcons.facebookF, size: 28.0,),),
                _getGradientIcon(context, icon: Icon(FontAwesomeIcons.qq, size: 28.0,)),
                _getGradientIcon(context, icon: Icon(FontAwesomeIcons.twitter, size: 28.0,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
