import 'package:flutter/material.dart';

import 'other_input_dialog.dart';

class DropDownInputWidget extends StatefulWidget {

  final List<String> itemList;
  final ValueChanged<String> onChanged;
  final String label;
  final bool  isEnabled;
  final double paddingTop;
  final double paddingBottom;
  final IconData iconData;
  final String disableHint;
  final bool manualInput;
  final double fontSize;
  const DropDownInputWidget({Key key,  this.fontSize = 18, this.manualInput = false, this.paddingTop = 5, this.paddingBottom = 10, this.disableHint = '', this.isEnabled = true, this.iconData = Icons.arrow_drop_down, @required this.itemList,@required this.onChanged, @required this.label}) : super(key: key);
  
  @override
  DropDownInputWidgetState createState() {
    return DropDownInputWidgetState();
  }
}

class DropDownInputWidgetState extends State<DropDownInputWidget> with OtherItemInputDelegate {

  List<DropdownMenuItem<String>> itemsList = [];
  String selectedItem;
  bool isEnabled;
  
  @override
  void initState() {
    super.initState();
    
    isEnabled = true;
    itemsList = widget.itemList.map<DropdownMenuItem<String>>((str) => DropdownMenuItem<String>(
      child: Text(str, maxLines: 2, style: TextStyle(fontSize: 12, height: 1)),
      value: str
    )).toList();
    selectedItem = itemsList[0].value;
    widget.onChanged(selectedItem);
  }
  
  void enable() {
    if(!mounted) return;
    if(!isEnabled) {
      setState(() {
        isEnabled = true;
      });
    }
  }
  
  void disable() {
    if(!mounted) return;
    if(isEnabled) {
      setState(() {
        isEnabled = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(widget.label, style: TextStyle(color: Color(0xff5A585D), height: 1, fontSize: 12)),      
      Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  child: DropdownButton( isDense: true, isExpanded: true, items: isEnabled ? itemsList : null, value: selectedItem, disabledHint: Text('$selectedItem', style: TextStyle(fontSize: 12, height: 1)), onChanged: (value) {
                    if(widget.manualInput && value == 'Other') {
                      OtherItemInputDialog(this, context).show();
                    } else {
                      setState(() {
                        selectedItem = value as String;
                      });
                      widget.onChanged(value as String);
                    }
                  }),
                ),
              ),
            )
          ),          
        ],
      ),
      
      Container(
        height: 2,
        margin: EdgeInsets.only(right: 15),
        color: Color.fromARGB(66, 196, 196, 196),
      )
    ]);
  }
  
  @override
  onItemInputed(String value) {
    setState(() {
      itemsList.insert(itemsList.length - 1, DropdownMenuItem<String>(value: value, child: Text(value)));
      selectedItem = value;
    });
    widget.onChanged(selectedItem);
    print(value);
    return null;
  }
}