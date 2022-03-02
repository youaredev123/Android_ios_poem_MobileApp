import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/claim/claim_description/ui/claim_description_screen.dart';
import '../bloc.dart';

class ClaimDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClaimDescriptionBloc>(
      create: (context) => ClaimDescriptionBloc(),
      child: ClaimDescriptionScreen(),
    );
  }
}