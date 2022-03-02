import 'package:flutter/material.dart';

class PlusMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Color(0xFF0065FB)
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        )
      ),
      child: Icon(Icons.add, color: Color(0xFF0065FB), size: 15),
    );
  }
}