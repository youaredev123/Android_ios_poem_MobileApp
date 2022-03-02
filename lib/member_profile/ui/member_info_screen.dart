import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/member_profile/bloc/bloc.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class MemberInfoScreen extends StatelessWidget {
  Widget _buildBarCode(MemberInfoState state) {
    if (state is MemberInfoReceived) {
      return state.memberInfo.barcodeImage;
    } else {
      return Text('');
    }
  }

  String _getMemberID(MemberInfoState state) {
    if (state is MemberInfoReceived) {
      return state.memberInfo.memberID;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberInfoBloc, MemberInfoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: PoemAppBar(
                      title: 'Member profile',
                    ),
                  ),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 20, top: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Member ID',
                                style: TextStyle(
                                    color: Color(0xFF5A585D), fontSize: 12)),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(_getMemberID(state),
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w600)))
                                  ],
                                )),
                          ],
                        )),
                  ),
                ],
              ),
              Center(child: _buildBarCode(state))
            ],
          )),
        );
      },
    );
  }
}
