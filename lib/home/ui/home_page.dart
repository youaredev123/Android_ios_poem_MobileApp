import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/home/home.dart';
import 'package:poem_mobile/home/home_bloc.dart';
import 'package:poem_mobile/home/home_repository.dart';
import 'package:poem_mobile/home/ui/bottom_navigation.dart';
import 'package:poem_mobile/home/ui/charts.dart';
import 'package:poem_mobile/home/ui/header.dart';
import 'package:poem_mobile/home/ui/nav_menu_widget.dart';
import 'package:poem_mobile/home/ui/summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeRepository())..add(Fetch(2)),
        child: SafeArea(
          child: Scaffold(
              bottomNavigationBar: BottomNavigation(),
              drawer: Drawer(
                  elevation: 5,
                  child: NavMenuWidget(onLogout: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  }, onMenuItemClicked: (String value) {
                    Navigator.pushNamed(context, value);
                  })),
              body: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 16),
                    child: HomeHeader(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Charts(),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Summary(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
