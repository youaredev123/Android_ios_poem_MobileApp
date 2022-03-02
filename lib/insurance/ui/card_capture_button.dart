import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CardCaptureButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String title;
  final double height;

  const CardCaptureButton({Key key, this.height = 60, this.title = '', this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(borderType: BorderType.RRect, radius: Radius.circular(10), color: Color(0x880085fe),child: Material(
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          color: Colors.transparent,
          height: height,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/images/camera.png', width: 20, fit: BoxFit.fitWidth),
                SizedBox(width: 5),
                Text(title, style: TextStyle(color: Color(0xff0085FE)))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}