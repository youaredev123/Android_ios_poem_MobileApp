import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/home/ui/home_page.dart';
import 'package:poem_mobile/login_register/login_register_screen.dart';
import 'package:poem_mobile/member_profile/ui/member_profile_page.dart';
import 'package:poem_mobile/provider_search/ui/provider_search_page.dart';
import 'package:poem_mobile/search_history/ui/serach_history_page.dart';
import 'package:poem_mobile/widgets/widgets.dart';

import 'change_username/ui/change_username_page.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/memberProfile': (context) => MemberProfilePage(),
        '/providerSearch': (context) => ProviderSearchPage(),
        '/searchHistory': (context) => SearchHistory(),
        '/changeUsername': (context) => ChangeUsernamePage(),
      },
      theme: ThemeData(fontFamily: 'SFProDisplay'),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            // return Test();
            return LoginRegisterScreen();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          // return SplashPage();
          return Text('Splash Screen Not Found');
        },
      ),
    );
  }
}