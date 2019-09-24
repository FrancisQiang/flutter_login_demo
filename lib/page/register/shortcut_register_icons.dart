import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShortcutRegisterIcons extends StatelessWidget {

  Widget _getShortcutIcon(context, {Icon icon}) {
    return Container(
      height: ScreenUtil.getInstance().setWidth(50.0),
      width: ScreenUtil.getInstance().setWidth(150.0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: icon == null ? Icon(Icons.clear) : icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(30.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getShortcutIcon(context, icon: Icon(FontAwesomeIcons.weibo, color: Colors.black54,),),
          _getShortcutIcon(context, icon: Icon(FontAwesomeIcons.qq, color: Colors.black54,),),
          _getShortcutIcon(context, icon: Icon(FontAwesomeIcons.twitter, color: Colors.black54,),),
          _getShortcutIcon(context, icon: Icon(FontAwesomeIcons.facebookF, color: Colors.black54,),),
          _getShortcutIcon(context, icon: Icon(FontAwesomeIcons.github, color: Colors.black54,),),
        ],
      ),
    );
  }
}
