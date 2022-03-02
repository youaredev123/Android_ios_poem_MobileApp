import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class AgreementItem extends StatefulWidget {

  final int number;
  final String agreementTitle;
  final String agreementDescription;
  final ValueChanged<bool> onChanged;

  AgreementItem({this.number, this.agreementTitle, this.agreementDescription,
    this.onChanged});

  @override
  AgreementItemState createState() {
    return AgreementItemState();
  }
}

class AgreementItemState extends State<AgreementItem> {

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          Text('${widget.number}.', style: TextStyle(color: Color(0xFF333333), fontSize: 12, height: 1.2)),
          Expanded(
            child: Container(child:  Text(' ${widget.agreementTitle}',
                style: TextStyle(color: Color(0xFF333333), fontSize: 12, height: 1.2)))
          )
        ]),
        SizedBox(height: 3),
        Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 2, top: 3),
              child: CustomCheckBox(
                  size: 13,
                  isChecked: isChecked,
                  onChanged: (value) {
                    widget.onChanged(value);
                    setState(() {
                      isChecked = !isChecked;
                    });
                  }
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child:  Text(widget.agreementDescription,
                      style: TextStyle(color: Color(0xff5A585D), height: 1.4, fontSize: 10))
                )
              ),
            ),
            SizedBox(height: 5),
          ]),
        )
      ]),
    );
  }
}