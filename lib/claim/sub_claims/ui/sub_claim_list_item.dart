import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:poem_mobile/claim/claim_description/ui/claim_description_page.dart';
import 'package:poem_mobile/claim/claims/ui/avatar.dart';
import 'package:poem_mobile/claim/claims/ui/claim_pie_chart.dart';
import 'package:poem_mobile/claim/claims/ui/payer_avatar.dart';
import 'package:poem_mobile/claim/claims/ui/price_table.dart';
import 'package:poem_mobile/models/claim.dart';

class SubClaimListItem extends StatelessWidget {
  
  final Claim claim;
  final VoidCallback onSubClaims;
  
  const SubClaimListItem({Key key, this.onSubClaims, this.claim}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
       actions: <Widget>[
        IconSlideAction(
          color: Color(0xFF433FFD),
          iconWidget: Text('Claim descr', style: TextStyle(color: Colors.white, fontSize: 12)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClaimDescription()));
          },
        ),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x19000000), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(offset: Offset(0,5), color: Color(0x20000000))
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AvatarWidget(showSymbol: false),
                            const SizedBox(width: 6),
                            Expanded(
                              child: ClaimPieChart()
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('11/27-12/31/19', style: TextStyle(color: Colors.red, fontSize: 10),)
                          ],
                        )
                      ]
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                     flex: 11,
                    child: PriceTable(
                      firstColor: Color(0xFFB6D3FF),
                      items: [
                        Item('B', 500.00),
                        Item('Ap', 500.00),
                        Item('PD', 500.00),
                        Item('CA', 500.00),
                        Item('PR', 500.00),
                        Item('DE', 500.00),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                               Text('2', style: TextStyle(color: Colors.black, fontSize: 10)),
                                const SizedBox(height: 7),
                                PayerAvatar(),
                            ],
                          ), 
                          const SizedBox(height: 7),
                          Text('459.00', style: TextStyle(color: Colors.black, fontSize: 10)),
                          const SizedBox(height: 5),
                          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                            Image.asset('assets/images/icon_gift.png', width: 16, height: 16),
                            const SizedBox(width: 10),
                            Image.asset('assets/images/icon_heart.png', width: 16, height: 16),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Text('Arnisa text here can also change', style: TextStyle(color: Colors.black, fontSize: 11),),
                        const SizedBox(height: 20),
                        Opacity(opacity: claim.isPaidByPatient ? 1.0 : 0.0, child: Image.asset('assets/images/icon_handbook.png', width: 16, height: 16))
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}