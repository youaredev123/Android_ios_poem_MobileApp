import 'package:flutter/material.dart';

 class RowContainer extends StatelessWidget {
  final Widget child;

  const RowContainer({Key key, this.child}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.symmetric(vertical: 2),
       padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(5))
       ),
       child: child,
     );
   }
}

class StatementTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xEEE4E9F5),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text('Statement 12/11 - 12/29/19', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 2),
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Text('Previous balance', style: TextStyle(fontSize: 9)),
                 ),
                 Expanded(
                   child: Text('Paid last cycle', style: TextStyle(fontSize: 9)),
                 ),
               ]
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 2),
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Text('New charges', style: TextStyle(fontSize: 9)),
                 ),
                 Expanded(
                   child: Text('Rewards', style: TextStyle(fontSize: 9)),
                 ),
               ]
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 2),
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Text('New balance', style: TextStyle(fontSize: 9)),
                 ),
                 Expanded(
                   child: Text('Refunds', style: TextStyle(fontSize: 9)),
                 ),
               ]
             ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Account', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('Due', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('Paid to date', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('Balance', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('Avaiable', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Prepay', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('PPI', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Buffer', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Late fees', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Interest', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           RowContainer(
             child: Column(
               children: <Widget>[
                 Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Budgeting', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                  ]
                ),
                Row(
              children: <Widget>[
                Expanded(
                  child: Text('Final claims**', style: TextStyle(fontSize: 9, color: Color(0xFF0367FC))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF0367FC))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF0367FC))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF0367FC))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF0367FC))),
                ),
              ]
            ),
               ],
             ),
           ),
           RowContainer(
             child: Column(
               children: <Widget>[
                 Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Due to providers', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                    Expanded(
                      child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                    ),
                  ]
                ),
                Row(
              children: <Widget>[
                Expanded(
                  child: Text('Estimated claims**', style: TextStyle(fontSize: 9, color: Color(0xFF00BF00))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF00BF00))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF00BF00))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF00BF00))),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9, color: Color(0xFF00BF00))),
                ),
              ]
            ),
               ],
             ),
           ),
           RowContainer(
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Monthly payment', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
                Expanded(
                  child: Text('12,345.67', style: TextStyle(fontSize: 9)),
                ),
              ]
            ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 2),
             child: Row(
               children: <Widget>[
                 Text('* Payment protection insurance', style: TextStyle(fontSize: 9)),
                 Spacer(),
                 Text('** 90 days past due', style: TextStyle(fontSize: 9)),
                 const SizedBox(width: 10)
               ]
             ),
           ),
           Text('Terms of Service', style: TextStyle(color: Color(0xFF0065FB), fontSize: 9, fontWeight: FontWeight.w500),)
        ]
      ),
    );
  }
}