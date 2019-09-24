import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_demo/config/my_const.dart';

class RegisterAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Register',
          style: TextStyle(
              fontFamily: MyConst.LOBSTER_FONT_FAMILY,
              fontSize: 35.0,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54
          ),
        ),
      )
    );
  }
}
