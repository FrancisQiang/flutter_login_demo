import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_demo/config/my_const.dart';
import 'package:login_demo/page/register/register_app_bar.dart';
import 'package:login_demo/page/register/register_form.dart';
import 'package:login_demo/page/register/shortcut_register_icons.dart';
import 'package:login_demo/util/navigator_util.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/register.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          children: <Widget>[
            RegisterAppBar(),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(50.0)
              ),
              height: ScreenUtil.getInstance().setWidth(250.0),
              width: ScreenUtil.getInstance().setWidth(250.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
            ),
            RegisterForm(),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Already have an account ?',
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 18.0,
                            letterSpacing: 1.2,
                            fontFamily: 'lobster',
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          NavigatorUtil.toLoginPage(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              letterSpacing: 1.2,
                              fontFamily: 'lobster',
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(50.0)
              ),
              child: Text(
                'Third part login',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15.0,
                    letterSpacing: 1.1,
                    fontFamily: 'lobster',
                ),
              ),
            ),
            ShortcutRegisterIcons()
          ],
        ),
      ),
    );
  }
}
