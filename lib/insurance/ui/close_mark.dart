import 'package:flutter/material.dart';

class CloseMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.red
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15)
        )
      ),
      child: Icon(Icons.close, color: Colors.red, size: 15),
    );
  }
}