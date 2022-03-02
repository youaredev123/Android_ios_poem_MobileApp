import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final String title;
  const HeaderCell({Key key, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Text(title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 9)));
  }
}

class SearchTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        fontSize: 9, fontWeight: FontWeight.w500, color: Colors.black);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 14,
            child: Text('Date', style: textStyle)
          ),
          Expanded(
            flex: 17,
            child: Text('Time', style: textStyle),
            // child: HeaderCell(title: 'Time'),
          ),
          Expanded(
            flex: 33,
            child: Text('Search by', style: textStyle)
          ),
          Expanded(
            flex: 19,
            child: Text('Location', style: textStyle)
          ),
          Expanded(
            flex: 17,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 3.0,
                    color: Color(0xFFE4E9F5)
                  )
                )
              ),
              child: HeaderCell(title: 'Have\nconcerns')
            )
          ),
        ],
      ),
    );
  }
}
