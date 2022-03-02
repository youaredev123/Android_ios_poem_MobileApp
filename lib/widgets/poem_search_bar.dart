import 'package:flutter/material.dart';

class PoemSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0x33000000),
          width: 2.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search, size: 20, color: Colors.black),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5)
              ),
            ),
          )
        ]
      ),
    );
  }
}