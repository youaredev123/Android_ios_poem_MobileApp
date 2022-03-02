import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        
      ],
    );
  }
}

class SearchResult extends StatelessWidget {
 
  List<TableRow> _buildTable() {
    List<TableRow> tableRows = [];
    tableRows.add(TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Name', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 1.6, color: Colors.black)),
        ),
        Text('Price', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 2, color: Colors.black)),
        Text('Time', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 2, color: Colors.black)),
        Text('Ratings', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 2, color: Colors.black)),
      ]
    ));
        
    tableRows.add(_buildRow());
    tableRows.add(_buildRow());
    tableRows.add(_buildRow());
    
    return tableRows;
  }
  
  TableRow _buildRow() {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text('Name xyz', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500,height: 3, color: Colors.black)),
      ),
      Text('', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 4, color: Colors.black)),
      Text('', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 4, color: Colors.black)),
      Text('', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, height: 4, color: Colors.black)),
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(10),
          1: FlexColumnWidth(4),
          2: FlexColumnWidth(4),
          3: FlexColumnWidth(4),
        },
        border: TableBorder(
          horizontalInside: BorderSide(
             color: Colors.grey,
             width: 1.0
          )
        ),
        children: _buildTable(),
      ),
    );
  }
}