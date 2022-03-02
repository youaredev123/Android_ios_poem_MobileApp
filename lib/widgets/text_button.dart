import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {

  final String text;
  final TextStyle style;
  final VoidCallback onPressed;
  final TextAlign align;
  final bool isEnabled;
  final int maxLines;
  const TextButton({Key key, this.maxLines = 1, this.isEnabled = true, this.text, this.align = TextAlign.left, this.style, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if(isEnabled) onPressed();
          },
          child: Text(text, maxLines: maxLines, textAlign: align, style: style),
        ),
    );
  }
}