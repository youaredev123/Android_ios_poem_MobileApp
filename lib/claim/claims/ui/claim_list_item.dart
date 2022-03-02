import 'package:flutter/material.dart';
import 'package:poem_mobile/claim/claims/ui/list_items/estimated_claim_list_item.dart';
import 'package:poem_mobile/claim/claims/ui/list_items/final_claim_list_item.dart';
import 'package:poem_mobile/claim/claims/ui/list_items/simple_final_claim_list_item.dart';
import 'package:poem_mobile/claim/sub_claims/ui/sub_claim_page.dart';
import 'package:poem_mobile/models/claim.dart';

class ClaimListItem extends StatefulWidget {
  
  final Claim claim;
  
  const ClaimListItem({Key key, this.claim}) : super(key: key);
  
  @override
  _ClaimListItemState createState() => _ClaimListItemState();
}

class _ClaimListItemState extends State<ClaimListItem> {
  @override
  Widget build(BuildContext context) {
    if(widget.claim.claimType == ClaimType.Estimated) {
      return EstimatedClaimListItem(claim: widget.claim);
    } else if(widget.claim.payerId == 0) {
      return SimpleFinalClaimListItem(claim: widget.claim);
    } else {
      return FinalClaimListItem(claim: widget.claim, onSubClaims: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SubClaimPage(parentID: 2)));
      });
    }
  }
}