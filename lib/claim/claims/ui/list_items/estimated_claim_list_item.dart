import 'package:flutter/material.dart';
import 'package:poem_mobile/claim/claims/ui/avatar.dart';
import 'package:poem_mobile/claim/claims/ui/price_table.dart';
import 'package:poem_mobile/models/claim.dart';

class EstimatedClaimListItem extends StatelessWidget {
  
  final Claim claim;
  
  const EstimatedClaimListItem({Key key, this.claim}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF23BB3B), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(offset: Offset(0,5), color: Color(0x20000000))
        ]
      ),
      child: Row(
        children: <Widget>[
          Expanded(flex: 15, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AvatarWidget(),
              const SizedBox(height: 5),
              Text('11/27-12/31/19', style: TextStyle(color: Colors.red, fontSize: 10),),
            ],
          )),      
          const SizedBox(width: 5),    
          Expanded(
            flex: 11,
            child: PriceTable(
              firstColor: Color(0xFFCEFFD6),
              items: [
                Item('PR', 500.00),
                Item('CP', 500.00),
                Item('DD', 500.00),
                Item('CI', 500.00),
                Item('SP', 500.00),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Text(''),
          ),
          Expanded(
            flex: 10,
            child: Text(claim.isPaidByPatient ? 'Final claim' : '', style: TextStyle(color: Color(0xFF0065FB), fontSize: 11),),
          ),
          const SizedBox(width: 20)
        ]
      ),
    );
  }
}