import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/member_profile/bloc/bloc.dart';
import 'package:poem_mobile/member_profile/ui/member_info_screen.dart';

class MemberProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberInfoBloc>(
      create: (context) => MemberInfoBloc(authenticationBloc: BlocProvider.of<AuthenticationBloc>(context), memberInfoRepository: MemberInfoRepository())
      ..add(FetchMemberInfo()),
      child: MemberInfoScreen(),
    );
  }
}