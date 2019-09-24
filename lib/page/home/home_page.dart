import 'package:flutter/material.dart';
import 'package:login_demo/config/widget_const.dart';

import 'drawer.dart';

class HomePage extends StatelessWidget {

  final String name;

  final String email;

  HomePage({this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.55),
          elevation: 20.0,
          title: Text(
            'Home',
            style: WidgetConst.APP_BAR_TEXT_STYLE,
          ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office),
              title: Text('message')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('setting')
          ),
        ],
      ),
      drawer: MyDrawer(name: name, email: email,)
    );
  }
}


