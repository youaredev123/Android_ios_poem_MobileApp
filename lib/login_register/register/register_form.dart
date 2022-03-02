import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/phone_verification/otp_code_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'bloc/bloc.dart';

class RegisterForm extends StatelessWidget {
  final _registerKey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _inviteCodeController = TextEditingController();
  final _refCodeController = TextEditingController();

  ButtonStatus _getButtonStatus(RegisterState state) {
    if (state is RegisterLoading) {
      return ButtonStatus.Loading;
    } else if (state is RegisterSuccess) {
      return ButtonStatus.Success;
    } else if (state is RegisterFaild) {
      return ButtonStatus.Failure;
    } else {
      return ButtonStatus.Normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterSuccess) {
            Timer(Duration(seconds: 1), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OTPCodeScreen()));
            });
          }
          return Column(children: <Widget>[
            Form(
              key: _registerKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              flex: 7,
                              child: PoemInputWidget(
                                  controller: _fullnameController,
                                  label:
                                      'Full name on government issued ID*\nFirst Middle Last')),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 2,
                            child: DropDownInputWidget(
                              itemList: ['Mr', 'Mrs'],
                              label: 'Suffix',
                              onChanged: (String value) {},
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      FractionallySizedBox(
                          widthFactor: 0.6,
                          child: PoemInputWidget(
                              controller: _usernameController,
                              label: 'Unique Username only\nused here*',
                              showBlurIcon: true)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: PoemInputWidget(
                                controller: _passwordController,
                                label: 'Password*',
                                showBlurIcon: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4, left: 30),
                              child: Text(
                                'Mix 8 or more Upper &\nlower case letters,\nnumbers 0-9 and symbols\n&%@!',
                                style: TextStyle(
                                    color: Color(0xFF5A585D), fontSize: 10),
                              ),
                            )
                          ]),
                      const SizedBox(height: 7),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: PoemInputWidget(
                                controller: _phoneNoController,
                                label: 'Mobile device number*',
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 10),
                              child: Text(
                                'Device where you will use\nthis application',
                                style: TextStyle(
                                    color: Color(0xFF5A585D), fontSize: 10),
                              ),
                            )
                          ]),
                      const SizedBox(height: 7),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: PoemInputWidget(
                      controller: _inviteCodeController,
                      label: 'Invite code',
                    ),
                  ),
                  Expanded(
                    child: PoemInputWidget(
                      controller: _refCodeController,
                      label: 'Referral code',
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              status: _getButtonStatus(state),
              text: 'Verify phone number',
              onPressed: () {
                if (_registerKey.currentState.validate()) {
                  BlocProvider.of<RegisterBloc>(context).add(Register());
                }
              },
            )
          ]);
        },
      ),
    );
  }
}
