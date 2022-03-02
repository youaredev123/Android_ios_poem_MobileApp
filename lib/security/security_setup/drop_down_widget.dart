import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {

  final List<String> itemList;
  final ValueChanged<String> onSelected;
  final bool disable;
  final bool disableDownIcon;
  final double fontSize;
  
  const DropDownWidget({Key key, this.fontSize = 12, this.disable = false, this.disableDownIcon = false, this.itemList, this.onSelected}) : super(key: key);
  
  @override
  DropDownWidgetState createState() {
    return DropDownWidgetState();
  }
}

class DropDownWidgetState extends State<DropDownWidget> {
  String value = '';
  List<DropdownMenuItem<String>> menuList = [];
  bool disable;
  
  @override
  void initState() {
    super.initState();

    disable = widget.disable;
    menuList = widget.itemList.map<DropdownMenuItem<String>>((item) =>  DropdownMenuItem<String>(child: Text(item ,style: TextStyle(color: Colors.grey, fontSize: 12)), value: item)).toList();
    value = menuList.isEmpty ? '': menuList[0].value;
  }

  @override
  void didUpdateWidget(DropDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.itemList != oldWidget.itemList) {
      menuList = widget.itemList.map<DropdownMenuItem<String>>((item) =>  DropdownMenuItem<String>(child: Text(item ,style: TextStyle(color: Colors.grey, fontSize: 12)), value: item)).toList();
      value = menuList.isEmpty ? '': menuList[0].value;
    }
    
    setState(() {
      disable = widget.disable;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print('build');
    return DropdownButton(
        icon: widget.disableDownIcon ? null : Icon(Icons.arrow_drop_down, color: Colors.grey),
        isExpanded: true,
        style: Theme.of(context).textTheme.title,
        underline: Text(''),
        disabledHint: Text(value, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12)),
        value: value,
        isDense: true,
        items: disable ? null : menuList,
        elevation: 10,
        onChanged: (value){
          setState(() {
            this.value = value as String;
            print(value);
            if(widget.onSelected != null) {
              widget.onSelected(value as String);
            }
          });
        });
  }
}