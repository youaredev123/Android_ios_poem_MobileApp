import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;

  const ActionButton({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1.0),
          boxShadow: [BoxShadow(offset: Offset(0, 5), color: Colors.grey[200])],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(title, style: TextStyle(color: Color(0xFF0065FB)),),
    );
  }
}
