import 'package:flutter/material.dart';
import 'package:poem_mobile/search_history/ui/search_hisotry_screen.dart';

class RoleSelect extends StatefulWidget {
  @override
  _RoleSelectState createState() => _RoleSelectState();
}

class _RoleSelectState extends State<RoleSelect> {

  String role = 'Primary';
  
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(flex: 15, child: Description(desc: 'Are you?*')),
      Expanded(
        flex: 20,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, groupValue: 'exp', value: role == 'Primary' ? 'exp' : '', activeColor: Colors.blue, onChanged: (value) {
              setState(() {
                role = 'Primary';
              });
            }),
            Text('Primary', style: TextStyle(color: Color(0xFF333333), fontSize: 12))
          ],
        ),
      ),
      Expanded(
        flex: 20,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, groupValue: 'exp', value: role == 'Dependent' ? 'exp' : '',  activeColor: Colors.blue, onChanged: (value) {
               setState(() {
                role = 'Dependent';
              });
            }),
            Text('Dependent', style: TextStyle(color: Color(0xFF333333), fontSize: 12))
          ],
        ),
      ),
      SizedBox(width: 30)
    ]);
  }
}