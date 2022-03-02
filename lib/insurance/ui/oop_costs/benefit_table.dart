import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyInputField extends StatefulWidget {

  final ValueChanged<double> onChanged;
  const MoneyInputField({Key key, this.isEnabled = true, this.onChanged}) : super(key: key);
  final bool isEnabled;
  @override
  MoneyInputFieldState createState() {
    return MoneyInputFieldState();
  }
}

class MoneyInputFieldState extends State<MoneyInputField> {

  MoneyMaskedTextController controller;
  bool isEnabled;

  @override
  void initState() {
    super.initState();

    isEnabled = widget.isEnabled;
    controller = MoneyMaskedTextController(decimalSeparator: '.', leftSymbol: '', thousandSeparator: ',');
    controller.afterChange = (String masked, double raw) {
      widget.onChanged(raw);
    };
  }
  
  @override
  void didUpdateWidget(MoneyInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if(widget.isEnabled != isEnabled) {
      setState(() {
        isEnabled = widget.isEnabled;
      });
    }
  }
  
  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: false,
        contentPadding: EdgeInsets.all(0)
      ),
      style: TextStyle(fontSize: 12, color: Color(0xFF333333)),
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
}

class DataCell extends StatelessWidget {

  final Widget child;

  const DataCell({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: child,
    );
  }
}

class BenefitTableWidget extends StatefulWidget {

  final String description;
  final ValueChanged<double> onIndividualDeductibleChanged;
  final ValueChanged<double> onIndividualOOPMaximumChanged;
  final ValueChanged<double> onFamilyDeductibleChanged;
  final ValueChanged<double> onFamilyOOPMaximumChaged;
  final ValueChanged<bool> isHasOOPMaximum;

  const BenefitTableWidget({Key key, this.description, this.onIndividualDeductibleChanged, this.onIndividualOOPMaximumChanged, this.onFamilyDeductibleChanged, this.onFamilyOOPMaximumChaged, this.isHasOOPMaximum}) : super(key: key);

  BenefitTableWidgetState createState() {
    return BenefitTableWidgetState();
  }
}

class BenefitTableWidgetState extends State<BenefitTableWidget> {

  bool haveOutOfPocket;
  
  @override
  void initState() {
    super.initState();
    haveOutOfPocket = true;
    widget.isHasOOPMaximum(haveOutOfPocket);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          child: Text(widget.description,
              style: TextStyle(
                color: Color(0xff5A585D), fontSize: 14)
              )
        ),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            value: haveOutOfPocket,
            onChanged: (value)  {
              setState((){
                haveOutOfPocket = value;
              });
              widget.isHasOOPMaximum(haveOutOfPocket);
            },
          ),
        ),
      ]),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Color(0x55999999),
              blurRadius: 5.0,
              spreadRadius: 1.0
            )
          ]
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            columnWidths: {
              0: FlexColumnWidth(80),
              1: FlexColumnWidth(90),
              2: FlexColumnWidth(174)
            },
            border: TableBorder(
              verticalInside: BorderSide(color: Color(0xFFE7E7E7), width: 1),
              horizontalInside: BorderSide(color: Color(0xFFE7E7E7), width: 1)
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                ),
                children: [
                  DataCell(
                    child: Text('Individual',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  DataCell(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Deductible',
                            style: TextStyle(color: Color(0xFF5A585D), fontSize: 12),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Row(children: <Widget>[
                              Expanded(
                                child: MoneyInputField(isEnabled: haveOutOfPocket, onChanged: (value){
                                  widget.onIndividualDeductibleChanged(value);
                                }),
                              )
                            ],)
                          ),
                        ]
                    ),
                  ),
                  DataCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Out-of-pocket maximum',
                          style: TextStyle(color: Color(0xFF5A585D), fontSize: 12),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Row(children: <Widget>[
                              Expanded(
                                child: MoneyInputField(isEnabled: haveOutOfPocket, onChanged: (value){
                                  widget.onIndividualOOPMaximumChanged(value);
                                }),
                              )
                            ],)
                        ),
                      ],
                    ),
                  )
                ]
              ),
              TableRow(
                  children: [
                    DataCell(
                      child: Text('Family',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    DataCell(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Deductible',
                              style: TextStyle(color: Color(0xFF5A585D), fontSize: 12),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    child: MoneyInputField(isEnabled: haveOutOfPocket, onChanged: (value){
                                      widget.onFamilyDeductibleChanged(value);
                                    }),
                                  )
                                ],)
                            ),
                          ]
                      ),
                    ),
                    DataCell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Out-of-pocket maximum',
                            style: TextStyle(color: Color(0xFF5A585D), fontSize: 12),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Row(children: <Widget>[
                                Expanded(
                                  child: MoneyInputField(isEnabled: haveOutOfPocket, onChanged: (value){
                                    widget.onFamilyOOPMaximumChaged(value);
                                  }),
                                )
                              ],)
                          ),
                        ],
                      ),
                    )
                  ]
              ),
            ],
          ),
        ),
      )
    ]);
  }
}