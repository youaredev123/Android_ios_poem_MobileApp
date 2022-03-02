import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/back_button.dart';

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15),
      child: Row(
        children: <Widget>[
          BackButtonWidget(color: Colors.black),
          Spacer(),
          Text('Claim description', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
          Spacer(),
          Image.asset('assets/images/icon_download.png', width: 20, fit: BoxFit.fitWidth),
          const SizedBox(width: 15),
          Image.asset('assets/images/icon_printer.png', width: 20, fit: BoxFit.fitWidth),
        ]
      ),
    );
  }
}