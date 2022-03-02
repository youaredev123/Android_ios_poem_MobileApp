import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  
  final bool showSymbol;
  
  const AvatarWidget({Key key, this.showSymbol = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('assets/images/user1.png', width: 32, height: 32, fit: BoxFit.fill),
        const SizedBox(height: 16),
        Opacity(opacity: showSymbol ? 1.0 : 0.0, child: Image.asset('assets/images/user_symbol.png', width: 35, height: 25, fit: BoxFit.fill,)),
      ],
    );
  }
}