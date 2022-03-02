import 'package:flutter/material.dart';
import 'package:poem_mobile/security/security_setup/drop_down_widget.dart';

class SecurityItem extends StatelessWidget {

  final List<String> itemList;
  final ValueChanged<String> onQuestionSelected;
  final ValueChanged<String> onAnswerChanged;
  final ValueChanged<String> onSubmitted;
  final double disableOpacity;
  final bool disable;
  
  SecurityItem({@required this.itemList,this.disable = false, this.onSubmitted, this.disableOpacity = 0.3, @required this.onQuestionSelected, this.onAnswerChanged});
  
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disable ? disableOpacity : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropDownWidget(fontSize: 16, disable: disable, onSelected: (value) {
           onQuestionSelected(value);
          }, itemList: itemList),
          Row(children: <Widget>[
            Expanded(
              child: TextFormField(
                enabled: disable ? false : true,
                style: TextStyle(color: Color(0xFF333333), height: 1, fontSize: 12),
                onChanged: (value) {
                  onAnswerChanged(value);
                },
                onFieldSubmitted: (value) {
                  onSubmitted(value);
                },                
                decoration: InputDecoration(
                    hintText: 'Type your answer',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                    hintStyle: TextStyle(color: Colors.grey, height: 1, fontSize: 12)
                ),
              ),
            )
          ]),
          Container(
            height: 1,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}