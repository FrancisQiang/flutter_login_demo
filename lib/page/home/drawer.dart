import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_demo/config/my_const.dart';

class MyDrawer extends StatelessWidget {

  final String name;

  final String email;

  MyDrawer({this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(700.0),
      child: Drawer(
        child: Container(
            alignment: Alignment.center,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(name, style: TextStyle(fontFamily: MyConst.LOBSTER_FONT_FAMILY, fontWeight: FontWeight.bold, fontSize: 26.0, letterSpacing: 2.5),),
                  accountEmail: Text(email, style: TextStyle(fontFamily: MyConst.LOBSTER_FONT_FAMILY, fontWeight: FontWeight.w200, fontSize: 15.0, letterSpacing: 1.0),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://francisqiang.github.io/images/avatar.gif'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://api.dujin.org/bing/1366.php'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.cyan.withOpacity(0.3),
                            BlendMode.srcOver
                        )
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Theme',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 3.0,
                        fontFamily: 'lobster'
                    ),
                  ),
                  leading: Icon(Icons.color_lens, size: 28.0, color: Colors.indigoAccent,),
                  trailing: Icon(Icons.keyboard_arrow_right, size: 28.0,),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Photo',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 3.0,
                        fontFamily: 'lobster'
                    ),
                  ),
                  leading: Icon(Icons.picture_in_picture_alt, size: 28.0, color: Colors.green,),
                  trailing: Icon(Icons.keyboard_arrow_right, size: 28.0,),
                  onTap: () {},
                ),
              ],
            )
        ),
      ),
    );
  }
}
