import 'package:flutter/material.dart';

class PayerAvatar extends StatelessWidget {
  
  final bool bordered;

  const PayerAvatar({Key key, this.bordered = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.orange, width: 2)
      ),        
      child: Image.asset('assets/images/payer_avatar.png', width: 40, height: 40)
    );
  }
}
