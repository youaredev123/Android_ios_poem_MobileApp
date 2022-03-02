import 'package:flutter/material.dart';

class LegendItem {
  final String shortSymbol;
  final String desc;

  LegendItem(this.shortSymbol, this.desc);
}

class LegendItemWidget extends StatelessWidget {
  final LegendItem legendItem;
  const LegendItemWidget({Key key, this.legendItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(legendItem.shortSymbol, style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400)),
          ),
          Expanded(
            flex: 5,
            child: Text(legendItem.desc, style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

class LegendPanel extends StatelessWidget {
  
  final List<LegendItem> legendList;
  
  const LegendPanel(this.legendList, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
        child: Column(
          children: List.generate(legendList.length, (int index) {
            return LegendItemWidget(legendItem: legendList[index]);
          }),
        ),
      ),
    );
  }
}