import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class PoemAppBar extends StatelessWidget {

 final String title;
  final bool showBackButton;
  const PoemAppBar({Key key,  this.showBackButton = true, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34, left: 0),
      child: Stack(children: <Widget>[
        Visibility(visible: showBackButton, child: BackButtonWidget(color: Colors.black)),
        const SizedBox(width: 35),
        Align(alignment: Alignment.center, child: Text(title, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),))
      ]),
    );
  }
}
