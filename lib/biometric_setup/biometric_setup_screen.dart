import 'package:flutter/material.dart';
import 'package:poem_mobile/identity/identity_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class BiometricSetupScreen extends StatefulWidget {
  @override
  BiometricSetupScreeState createState() {
    return BiometricSetupScreeState();
  }
}

class BiometricSetupScreeState extends State<BiometricSetupScreen> {
  
  int patientId;
  String biometric = '';
  // LocalAuthentication localAuth;
  
  @override
  void initState() {
    super.initState();
    // patientId = SessionManager.getUserID();

    // localAuth = LocalAuthentication();
  }
  
  handleSetup() async{
    // bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    // if(!canCheckBiometrics) {
    //   Global.showToastMessage('Could not use local authentication');
    //   return;
    // }

    // await localAuth.authenticateWithBiometrics(
    //     localizedReason: 'Please authenticate to show account balance');

//    bool res  = await ApiClient.savebiometricInfo(patientId, biometric);
//    if(res){
//      Navigator.push(context, MaterialPageRoute(builder:  (context) => ProfileScreen()));
//    } else {
//      Global.showToastMessage('Biometric authentication setup failed');
//    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: <Widget>[
                PoemAppBar(
                  title: 'Set up biometric verification',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 17, right: 8, bottom: 30),
                  child: Text(
                   'For added security, we strongly recommend that you set up and use your device\'s biometric authentication.',
                    style: TextStyle(color: Color(0xFF5A585D), fontSize: 12, height: 1.4)
                  ),
                ),
                Image.asset('assets/images/face.jpg', width: 130, height: 130, fit: BoxFit.fill),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Container(
                    margin: EdgeInsets.only(left: 5, bottom: 5),
                    height: 2,
                    color: Color(0xFF99A0B1),
                  ),
                ),
                Center(
                  child: Image.asset('assets/images/fingerprint.jpg', width: 122, height: 122, fit: BoxFit.fill),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10 ),
                  child: TextButton(text: 'Skip', style: TextStyle(color: Color(0xFF5A585D), fontSize: 14),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder:  (context) => ProfileScreen()));
                  }),
                ),
                CustomButton(
                  text: 'Confirm identity',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IdentityScreen()));
                  },
                ),
                const SizedBox(height: 30)
              ]),
            ),
          ),
        )
      ),
    );
  }
}