import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'bloc/bloc.dart';

class LoginForm extends StatelessWidget {
  
  final _loginFormKey = GlobalKey<FormState>();
  
  final TextEditingController _usernameController = TextEditingController(text: '');
  final TextEditingController _passwordController = TextEditingController(text: '');
  
  ButtonStatus _confirmStatus(LoginState state) {
    if(state is InitialLoginState) {
      return ButtonStatus.Normal;
    } else if(state is LoginLoading) {
      return ButtonStatus.Loading;
    } else if(state is LoginSuccess) {
      return ButtonStatus.Success;
    } else if(state is LoginFailed) {
      return ButtonStatus.Failure;
    } else {
      return ButtonStatus.Normal;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(BlocProvider.of<AuthenticationBloc>(context)),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(children: <Widget>[
            Form(
              key: _loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            PoemInputWidget(
                              controller: _usernameController,
                              label: 'Username*',
                              showBlurIcon: true,
                            ),
                            TextButton(
                                text: 'Forgot username',
                                style: TextStyle(
                                    fontSize: 12, height: 1, fontWeight: FontWeight.w500, color: Color(0xFF0065FB))),
                            const SizedBox(height: 8),
                            PoemInputWidget(
                              controller: _passwordController,
                                label: 'Password*', showBlurIcon: true),
                            TextButton(
                                text: 'Forgot password',
                                style: TextStyle(
                                    fontSize: 12, height: 1, fontWeight: FontWeight.w500, color: Color(0xFF0065FB))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22, left: 20),
                        child: Text(
                          'Sign in with\nBiometric',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              height: 1.4,
                              // decoration: TextDecoration.underline,
                              color: Color(0xFF0065FB)),
                        ),
                      )
                    ]),
              ),
            ),
            CustomButton(
              status: _confirmStatus(state),
              text: 'Sign in',
              onPressed: () {
                if(_loginFormKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(Login(userName: _usernameController.text, password: _passwordController.text));
                }
              },
            ),
          ]);
        },
      ),
    );
  }
}
