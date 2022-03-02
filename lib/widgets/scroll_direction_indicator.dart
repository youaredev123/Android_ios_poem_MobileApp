import 'package:flutter/material.dart';

class ScrollDirectionIndicator extends StatelessWidget {

  final bool isScrollingUp;
  final ValueChanged<bool> onUp;
  
  const ScrollDirectionIndicator({Key key, this.onUp, this.isScrollingUp}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(onUp != null) {
          onUp(isScrollingUp);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x33555860),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        width: 40,
        height: 40,
        // child: Icon((isScrollingUp ?? false) ? Icons.arrow_upward  : Icons.arrow_downward),
        child: Center(child: Image.asset((isScrollingUp ?? false) ? 'assets/images/scroll_direction_down.png' : 'assets/images/scroll_direction_up.png', width: 20, fit: BoxFit.fitWidth)),
      ),
    );
  }
}