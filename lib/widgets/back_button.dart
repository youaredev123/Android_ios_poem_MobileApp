import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {

  final BuildContext context;
  final VoidCallback onBack;
  final Color color;

  BackButtonWidget({Key key, this.onBack, this.context, this.color= Colors.white}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if(onBack == null) {
              Navigator.pop(context);
            } else {
              onBack();
            }
          },
          child: Icon(Icons.arrow_back_ios, size: 20, color: color),
        ),
      ),
    );
  }
}