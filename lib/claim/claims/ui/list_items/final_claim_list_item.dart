import 'package:flutter/material.dart';
import 'package:poem_mobile/claim/claim_description/ui/claim_description_page.dart';
import 'package:poem_mobile/claim/claims/ui/avatar.dart';
import 'package:poem_mobile/claim/claims/ui/payer_avatar.dart';
import 'package:poem_mobile/claim/claims/ui/price_table.dart';
import 'package:poem_mobile/helpers/global.dart';
import 'package:poem_mobile/models/claim.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../claim_pie_chart.dart';

class FinalClaimListItem extends StatelessWidget {
  final Claim claim;
  final VoidCallback onSubClaims;

  const FinalClaimListItem({Key key, this.onSubClaims, this.claim})
      : super(key: key);

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
        IconSlideAction(
          color: Color(0xFF08A221),
          iconWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/content-copy.png', width: 20, height: 20,),
              Text('Sub claims', style: TextStyle(color: Colors.white, fontSize: 12))
            ],
          ),
          onTap: onSubClaims,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Estimate',
          color: Color(0xFF8E35E8),
          icon: Icons.more_horiz,
          onTap: () => showToastMessage('More'),
        ),
        IconSlideAction(
          caption: 'Claim financial',
          // color: Color(0xFFFFA500),
          color: Color(0xFFFFA500),
          icon: Icons.more_horiz,
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ClaimFinancialInfo()));
          },
        ),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: claim.isPoemDiscount ? Colors.orange : Color(0xFF218CED),
                width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(offset: Offset(0, 5), color: Color(0x20000000))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                      Widget>[
                Expanded(
                  flex: 15,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AvatarWidget(),
                            const SizedBox(width: 6),
                            Expanded(
                                child: claim.isPaidByPatient
                                    ? Text(
                                        'Arnisa text here can also change... ',
                                        style: TextStyle(fontSize: 10))
                                    : ClaimPieChart()),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '11/27-12/31/19',
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            ),
                            Spacer(),
                            Opacity(
                                opacity: claim.isPaidByPatient ? 1.0 : 0.0,
                                child: Image.asset(
                                    'assets/images/icon_handbook.png',
                                    width: 16,
                                    height: 16))
                          ],
                        )
                      ]),
                ),
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
                      Item('Adj', 500.00),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('2',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10)),
                            const SizedBox(height: 7),
                            PayerAvatar(),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text('459.00',
                            style:
                                TextStyle(color: Colors.black, fontSize: 10)),
                        const SizedBox(height: 5),
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Image.asset('assets/images/icon_gift.png',
                              width: 16, height: 16),
                          const SizedBox(width: 10),
                          Image.asset('assets/images/icon_heart.png',
                              width: 16, height: 16),
                        ])
                      ],
                    ),
                  ),
                ),
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
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset('assets/images/content-copy.png',
                  width: 16, height: 16),
            )
          ],
        ),
      ),
    );
  }
}
