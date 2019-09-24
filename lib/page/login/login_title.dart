import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_demo/config/my_const.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20.0)
      ),
      child: Text(
        'Login',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: MyConst.LOBSTER_FONT_FAMILY,
          letterSpacing: 12.0,
          fontSize: 45.0
        ),
      ),
    );
  }
}
