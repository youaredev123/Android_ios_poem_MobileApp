import 'dart:async';
import 'package:flutter/material.dart';
import 'package:poem_mobile/security/security_setup/security_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  EmailVerificationScreenState createState() {
    return EmailVerificationScreenState();
  }
}

class EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Timer _expireTimer;
  int _expireTime;
  int id = -1;
  String email = '';
  String delEmail = 'aa******@a***com';
  String emailCode = '';
  String timeString = '';

  bool resendable = false;

  void startTimer() {
    stopTimer();
    setState(() {
      resendable = false;
    });
    _expireTime = 120;
    _expireTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_expireTime <= 0) {
        stopTimer();
        setState(() {
          resendable = true;
        });
        return;
      }

      _expireTime--;
      setState(() {
        timeString = convertSecToString(_expireTime);
      });
    });
  }
  
  void stopTimer() {
    _expireTimer?.cancel();
  }
  
  String convertSecToString(int secs) {
    
    int min = secs ~/ 60;
    int sec = secs % 60;

    String timeStr = '';
    if (min / 10 < 1) {
      timeStr += '0$min';
    } else {
      timeStr += min.toString();
    }

    timeStr += ':';

    if (sec / 10 < 1) {
      timeStr += '0$sec';
    } else {
      timeStr += sec.toString();
    }
    return timeStr;
  }
  
  onVerify() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecuritySetupScreen()));
    // var res = await PoemApiClient.doVerifyEmail(id, email, emailCode);
    // if (res) {
    //   Global.showToastMessage('Verification Success');
    //   Timer(Duration(seconds: 3), () {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => SecuritySetupScreen()));
    //   });
    // } else {
    //   Global.showToastMessage('Please try again');
    // }
  }
  
  void handleResend() async {
    // var res = await PoemApiClient.checkEmailAvailability(email: email);
    // if (res) {
    //   Global.showToastMessage('Please check your email to verify');
    //   startTimer();
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // id = SessionManager.getUserID();
    // email = SessionManager.getEmail();
    // delEmail = 'aa*****@a***.com';
    // if (email != '') {
    //   print('email===> $email');
    //   int ind = email.lastIndexOf('@') ?? -1;
    //   ind = ind + 1;
    //   delEmail = email.substring(0, 2) +
    //       '*****@' +
    //       email.substring(ind, ind + 1) +
    //       '***.com';
    // }
    // print('delEmail $delEmail');
    // startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    stopTimer();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: PoemAppBar(
                  title: 'Email verification',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10),
                child: Align(alignment: Alignment.bottomRight, child: Text('02:00 minutes', style: TextStyle(fontSize: 18),)),
              ),
              const SizedBox(height: 5),
              Image.asset(
                'assets/images/email_ver_logo.png',
                width: 350,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text('Verification code',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 13, bottom: 10),
                  child: Text('Enter verification code sent to email\n' + delEmail,
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 12,
                      // isCenter: true,
                      color: Color(0xFF5A585D),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 13, bottom: 15),
                  child: Column(children: <Widget>[
                    PinCodeTextField(
                      autofocus: true,
                      hideCharacter: false,
                      highlight: true,
                      highlightColor: Colors.black,
                      defaultBorderColor: Colors.black,
                      hasTextBorderColor: Colors.grey,
                      maxLength: 6,
                      pinBoxWidth: 50,
                      pinBoxHeight: 50,
                      onTextChanged: (text) {
                        setState(() {
                          setState(() {
                            emailCode = '';
                          });
                        });
                      },
                      onDone: (text) {
                        setState(() {
                          emailCode = text;
                        });
                      },
                      pinCodeTextFieldLayoutType:
                          PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                      wrapAlignment: WrapAlignment.start,
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                      pinTextStyle:
                          TextStyle(fontSize: 18.0, color: Colors.black),
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.scalingTransition,
                      pinTextAnimatedSwitcherDuration:
                          Duration(milliseconds: 300),
                    ),
                    SizedBox(height: 10),
                    Text('Didn\'t receive verification code?',
                     style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5A585D),
                     ),
                    ),
                    SizedBox(height: 20),
                    Opacity(
                      opacity: resendable ? 1.0 : 0.3,
                      child: TextButton(
                        text: 'Resend code',
                        isEnabled: resendable,
                        style: TextStyle(color: Color(0xFF0065FB), fontSize: 14),
                        onPressed: () {
                          handleResend();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 30),
                      child: CustomButton(
                        height: 60,
                          fontSize: 24,
                          isDisabled: emailCode == '',
                          onPressed: () {
                            onVerify();
                          },
                          text: 'Verify'),
                    ),
                    const SizedBox(height: 60)
                  ])),
            ]),
          )),
    );
  }
}
