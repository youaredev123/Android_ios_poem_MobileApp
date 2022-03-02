import 'package:flutter/material.dart';

class PoemInputWidget extends StatefulWidget {

  final String label;
  final bool showBlurIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const PoemInputWidget({Key key, this.label = '', this.showBlurIcon = false, this.controller, this.keyboardType = TextInputType.text}) : super(key: key);
  @override
  _PoemInputWidgetState createState() => _PoemInputWidgetState();
}

class _PoemInputWidgetState extends State<PoemInputWidget> {

  FocusNode _focus = FocusNode();
  
  bool isSecureText;
  TextEditingController _controller;
  bool validationError = false;
  bool focused = false;
  
  @override
  void initState() {
    super.initState();
  
    _focus.addListener(_onFocusChange);
    isSecureText = true;
    if(widget.controller == null) {
      _controller = TextEditingController();
    } else {
      _controller = widget.controller;
    }
  }
  
   void _onFocusChange(){
    // if(_focus.hasFocus) {
    //   setState(() {
    //     focused = true;
    //   });
    // } else {
    //   setState(() {
    //     focused = false;
    //   });
    // }
  }
  
  Widget buildVisibilityButton() {
    String asset = isSecureText ? 'assets/images/icon_hide.png' : 'assets/images/icon_show.png';
    return InkWell(
      onTap: () {
       isSecureText = !isSecureText;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Image.asset(asset, width: 20, fit: BoxFit.fitWidth),
      ),
    );
    // return isSecureText ? IconButton(
    //     icon: Icon(Icons.visibility_off, color: Color(0xFFC4C4C4), size: 20), onPressed: () {
    //     setState(() {
    //       isSecureText = !isSecureText;
    //     });
    // }) : IconButton(icon: Icon(Icons.visibility, color: Color(0xFFC4C4C4), size: 20,), onPressed: () {
    //   setState(() {
    //     isSecureText = !isSecureText;
    //   });
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    
    const double bigFontSize = 28;
    const double smallFontSize = 14;
    
    String validate(String val) {
      if(val.isEmpty) {
        setState(() {
          validationError = true;
        });
        return '';
      } else {
        setState(() {
          validationError = false;
        });
        return null;
      }
    }
      
    return Card(
      margin: EdgeInsets.only(top: 8),
      color: focused ? Colors.white : Colors.white,
      elevation: focused ? 5 : 0,
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: focused ? 5 : 0),
        decoration: BoxDecoration(
          border: Border.all(color: !focused ? Colors.transparent : Colors.blue, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.label, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12)),
                      TextFormField(
                        keyboardType: widget.keyboardType,
                        controller: _controller,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        validator: validate,
                        obscureText: widget.showBlurIcon ? isSecureText : false,
                        focusNode: _focus,
                        style: TextStyle(
                          color: focused ? Color(0xFF5A585D) : Color(0xFF333333),
                          fontSize: focused ? bigFontSize : smallFontSize
                        ),
                        decoration: InputDecoration(     
                          border: InputBorder.none,
                          errorStyle: TextStyle(height: 0),
                          contentPadding: EdgeInsets.symmetric(vertical: 0)
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(visible: widget.showBlurIcon, child: buildVisibilityButton())
              ],
            ),
            Container(
              height: 2,
              color: !focused ? (validationError ? Colors.red : Color.fromARGB(66, 196, 196, 196)) : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}