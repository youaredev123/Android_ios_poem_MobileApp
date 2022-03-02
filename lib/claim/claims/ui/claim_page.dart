import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/claim/claims/claim_bloc.dart';
import 'package:poem_mobile/claim/claims/claim_event.dart';
import 'package:poem_mobile/claim/claims/claims_repository.dart';
import 'package:poem_mobile/claim/claims/ui/claim_list_screen.dart';

class ClaimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClaimBloc>(
      create: (context) => ClaimBloc(ClaimRepository())
      ..add(Fetch()),
      child: ClaimListScreen(),
    );
  }
}