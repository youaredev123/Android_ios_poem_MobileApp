import 'package:flutter/material.dart';
import 'package:poem_mobile/search_history/ui/search_hisotry_screen.dart';

class FinanceResoponseSelect extends StatefulWidget {
  @override
  _RoleSelectState createState() => _RoleSelectState();
}

class _RoleSelectState extends State<FinanceResoponseSelect> {

  String role = 'Me';
  
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(flex: 2, child: Description(desc: 'Financially responsible party*')),
      Expanded(
        flex: 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, groupValue: 'response', value: role == 'Me' ? 'response' : '', activeColor: Colors.blue, onChanged: (value) {
              setState(() {
                role = 'Me';
              });
            }),
            Text('Me', style: TextStyle(color: Color(0xFF333333), fontSize: 12))
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, groupValue: 'response', value: role == 'Other' ? 'response' : '',  activeColor: Colors.blue, onChanged: (value) {
               setState(() {
                role = 'Other';
              });
            }),
            Text('Other', style: TextStyle(color: Color(0xFF333333), fontSize: 12))
          ],
        ),
      ),
    ]);
  }
}