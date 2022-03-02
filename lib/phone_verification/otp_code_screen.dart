import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/basic_data/basic_data_screen.dart';
import 'package:poem_mobile/phone_verification/bloc/phone_verification_repository.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'bloc/bloc.dart';

class OTPCodeScreen extends StatefulWidget {

  @override
  _OTPCodeScreenState createState() => _OTPCodeScreenState();
}

class _OTPCodeScreenState extends State<OTPCodeScreen> {
  
  String otpCode = '';
  
  ButtonStatus _getButtonStatus(PhoneVerificationState state) {
    if(state is VerifyLoading) {
      return ButtonStatus.Loading;
    } else if(state is VerifySuccess) {
      return ButtonStatus.Success;
    } else if(state is VerifyFailure) {
      return ButtonStatus.Failure;
    } else {
      return ButtonStatus.Normal;
    }
  }
  
 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneVerificationBloc(PhoneVerificationRepository()),
      child: BlocBuilder<PhoneVerificationBloc, PhoneVerificationState>(
        builder: (context, state) {
          if(state is VerifySuccess) {
            Timer(Duration(seconds: 1), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BasicDataScreen()));
            });
          }
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: PoemAppBar(title: 'Enter verification code'),
                  ),
                  const SizedBox(height: 140),
                  Text('Enter verification code   00:00 Secs', style: TextStyle(fontSize: 18, color: Colors.black)),
                  const SizedBox(height: 88),
                  Text('Verification code sent to the device with the\nmobile number ending in ********75', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12, height: 1.8),),
                  const SizedBox(height: 38),
                  PinCodeTextField(
                    autofocus: true,
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: Colors.black,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.black,
                    pinBoxHeight: 50,
                    pinBoxWidth: 50,
                    maxLength: 6,
                    onTextChanged: (text) {
                      
                    },
                    onDone: (text){
                      otpCode = text;
                    },
                    pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                    wrapAlignment: WrapAlignment.start,
                    pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                    pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                  ),
                  const SizedBox(height: 25),
                  Text('Didn\'t receive the code or failed?\nGo back and recheck your number. Then try again.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12, height: 1.6),),
                  const SizedBox(height: 20),
                  CustomButton(
                    status: _getButtonStatus(state),
                    text: 'Verify',
                    onPressed: () {
                      if(otpCode.isNotEmpty) {
                        BlocProvider.of<PhoneVerificationBloc>(context).add(Verify(otpCode));
                      }
                    },
                  ),
                  const SizedBox(height: 20)
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
