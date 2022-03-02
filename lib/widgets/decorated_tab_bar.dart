import 'package:flutter/material.dart';

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
   
  final TabBar tabBar;
  final BoxDecoration decoration;
  
  const DecoratedTabBar({Key key, this.tabBar, this.decoration}) : super(key: key);
   
  @override 
  Size get preferredSize => tabBar.preferredSize;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar
      ],
    );
  }
}