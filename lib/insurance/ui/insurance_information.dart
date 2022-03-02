import 'package:flutter/material.dart';
import 'package:poem_mobile/insurance/ui/close_mark.dart';
import 'package:poem_mobile/insurance/ui/plus_icon.dart';

///assets/images/fa-regular_edit.png

class InsuranceInformation extends StatelessWidget {

  TableRow _buildInformationItem(int index, String company) {
    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Color(0xFFECE9F1) : Colors.transparent
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5),
          child: Text(company, style: TextStyle(fontSize: 10)),
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 15),
            Image.asset('assets/images/fa-regular_edit.png', width: 20, fit: BoxFit.fitWidth),
            const SizedBox(width: 10),
            CloseMark(),
          ],
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 15),
            Image.asset('assets/images/fa-regular_edit.png', width: 20, fit: BoxFit.fitWidth),
            const SizedBox(width: 10),
            CloseMark(),
          ],
        ),
      ]
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  PlusMark(),
                  const SizedBox(width: 5),
                  Text('Insurance information', style: TextStyle(color: Color(0xFF0065FB), fontSize: 12),)
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  PlusMark(),
                  const SizedBox(width: 5),
                  Text('OOP costs information', style: TextStyle(color: Color(0xFF0065FB), fontSize: 12),)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Color(0xFFECE9F1)
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Table(
            border: TableBorder(
              verticalInside: BorderSide(
                width: 1.0,
                color: Color(0xFFECE9F1)
              )
            ),
            columnWidths: {
              0: FlexColumnWidth(6),
              0: FlexColumnWidth(2),
              0: FlexColumnWidth(2),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                    child: Text('Insurance company', style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                  Center(child: Text('Insurance info', style: TextStyle(fontSize: 10, color: Colors.black))),
                  Center(child: Text('OOP costs', style: TextStyle(fontSize: 10, color: Colors.black))),
                ]
              ),
              _buildInformationItem(0, 'Abc Insurance company-Medical'),
              _buildInformationItem(1, 'Abc Insurance company-Medical'),
              _buildInformationItem(2, 'Abc Insurance company-Medical'),
            ],
          ),
          
        )
      ],
    );
  }
}