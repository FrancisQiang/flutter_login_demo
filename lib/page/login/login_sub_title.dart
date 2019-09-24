import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20.0)
      ),
      child: Text(
        'Good to see you again',
        style: TextStyle(
          color: Colors.deepOrange.withOpacity(0.68),
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
          fontSize: 20.0
        ),
      ),
    );
  }
}
