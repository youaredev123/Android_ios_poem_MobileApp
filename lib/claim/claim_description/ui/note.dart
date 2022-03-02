import 'package:flutter/material.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class NotdePanel extends StatelessWidget {
  
  final String title;
  final String dateStr;
  final String desc;

  const NotdePanel({Key key, this.title, this.dateStr, this.desc}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0
        ),
        boxShadow: [
          BoxShadow(offset: Offset(0,5), color: Colors.grey[200])
        ],
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
              Spacer(),
              Text(dateStr, style: TextStyle(fontSize: 12, color: Colors.black)),
              const SizedBox(width: 15),
              Icon(Icons.more_vert, color: Color(0xFF0065FB))
            ],
          ),
          ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting',
            trimLines: 2,
            style: TextStyle(
                fontSize: 14, color: Color(0xFF8B93A6)),
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...More',
            trimExpandedText: ' ...Less ',
          ),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}