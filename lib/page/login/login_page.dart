import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_form.dart';
import 'login_sub_title.dart';
import 'login_title.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2340)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(100)
          ),
          height: ScreenUtil.getInstance().setHeight(1650),
          width: ScreenUtil.getInstance().setWidth(850),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.all(Radius.circular(40.0))
          ),
          child: Column(
            children: <Widget>[
              LoginTitle(),
              LoginSubTitle(),
              LoginForm()
            ],
          ),
        )
      ),
    );
  }
}
