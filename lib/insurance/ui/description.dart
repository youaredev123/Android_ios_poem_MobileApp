import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  
  final String desc;

  const Description({Key key, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(desc, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12));
  }
}