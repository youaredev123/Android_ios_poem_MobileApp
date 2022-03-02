import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  
  final String icon;
  final int count;
  
  const NotificationIcon({Key key, this.icon, this.count}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 22,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Align(alignment: Alignment.centerRight, child: Image.asset(icon, width: 22, height: 22, fit: BoxFit.fill)),
            Align(alignment: Alignment.topLeft, child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2.0
                ),
                
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Center(child: Text('$count', style: TextStyle(fontSize: 10, height: 1))),
            ))
        ],
      ),
    );
  }
}