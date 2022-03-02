import 'dart:ffi';

import 'package:flutter/material.dart';

class Item {
  
  String item;
  double value;

  Item(this.item, this.value);
}

class PriceItem extends StatelessWidget {
  
  final Color color;
  final Item item;
  
  const PriceItem({Key key, this.color, this.item,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Row(children: <Widget>[
        Expanded(flex: 3, child: Text(item.item, style: TextStyle(fontSize: 9, color: Colors.black))),
        Expanded(flex: 4, child: Text('${item.value}', style: TextStyle(fontSize: 9, color: Colors.black))),
      ]),
    );
  }
}

class PriceTable extends StatelessWidget {

  final Color firstColor;
  final List<Item> items;
  
  const PriceTable({Key key, this.items, this.firstColor = const Color(0xFFCEFFD6)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: firstColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),      
      child: Card(
        margin: EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: List.generate(items.length, (int index) {
            return PriceItem(color: index % 2 == 0 ? firstColor : Colors.white, item: items[index]);
          }),
        ),
      ),
    );
  }
}