import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class ClaimHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 0),
      child: Row(children: <Widget>[
        const SizedBox(width: 17),
        BackButtonWidget(color: Colors.black),
        const SizedBox(width: 50),
        Text(
          'Claims',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Image.asset('assets/images/icon_download.png', width: 20, fit: BoxFit.fitWidth),
        const SizedBox(width: 15),
        Image.asset('assets/images/icon_printer.png', width: 20, fit: BoxFit.fitWidth),
        const SizedBox(width: 15),
        NotificationIcon(icon: 'assets/images/icon_bill.png', count: 2),
        const SizedBox(width: 15),
        NotificationIcon(icon: 'assets/images/icon_bell.png', count: 2),
        const SizedBox(width: 15),
      ]),
    );
  }
}
