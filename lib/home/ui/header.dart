import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('POEM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Spacer(),
        NotificationIcon(icon: 'assets/images/icon_bill.png', count: 2),
        const SizedBox(width: 20),
        NotificationIcon(icon: 'assets/images/icon_bell.png', count: 2),
        const SizedBox(width: 20),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        )
      ],
    );
  }
}