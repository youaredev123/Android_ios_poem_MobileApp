import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/claim/claims/claims_repository.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_bloc.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_event.dart';
import 'package:poem_mobile/claim/sub_claims/ui/sub_claim_list_screen.dart';

class SubClaimPage extends StatelessWidget {

  final int parentID;

  const SubClaimPage({Key key, this.parentID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubClaimBloc>(
      create: (context) => SubClaimBloc(parentID, ClaimRepository())
      ..add(Fetch()),
      child: SubClaimListScreen(parentID),
    );
  }
}