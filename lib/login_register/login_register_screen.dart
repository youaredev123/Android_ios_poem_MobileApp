import 'package:flutter/material.dart';
import 'package:poem_mobile/login_register/login/login_form.dart';
import 'package:poem_mobile/login_register/register/register_form.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class LoginRegisterScreen extends StatefulWidget {

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  
 bool showSignupScreen = false;

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 58),
                Text('POEM', style: TextStyle(fontSize: 56, height: 1, color: Color(0xFF175EFA), fontWeight: FontWeight.bold)),
                SizedBox(height: 41),
                Text('Patient Out-of-pocket', style: TextStyle(fontSize: 22,  fontWeight: FontWeight.w600, height: 1, color: Color(0xff4A4E5A))),
                SizedBox(height: 20),
                Text('Expenses Management', style: TextStyle(fontSize: 22,  fontWeight: FontWeight.w600, height: 1, color: Color(0xff4A4E5A))),
                SizedBox(height: 25),
                LoginForm(),
                SizedBox(height: 9),
                InkWell(
                  onTap: () {
                    setState(() {
                      showSignupScreen = !showSignupScreen;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('No account, ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4A4E5A)),),
                      Text('Sign up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0065FB)),)
                    ],
                  ),
                ),
                SizedBox(height: 10),
                AbsorbPointer(absorbing: !showSignupScreen, child: Opacity(opacity: showSignupScreen ? 1.0 : 0.5, child: RegisterForm())),
                TextButton(
                  text: 'Provider Search',
                  style: TextStyle(
                    color: Color(0xFF0065FB),
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  
  bool focused = false;


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {},
      child: TextField(
        
        style: TextStyle(
          fontSize: focused ? 28 : 14
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Hello',
        ),
      ),
    );
  }
}
