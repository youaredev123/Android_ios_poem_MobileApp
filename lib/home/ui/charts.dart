import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/home/home.dart';
import 'package:poem_mobile/home/ui/line_chart.dart';

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      condition: ((context, state) {
        return state is DataLoaded;
      }),
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 5, right: 22, left: 20),
              child: LineChart(title: 'Time - deductible', lineData: state is DataLoaded ? state.deductible : null),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, right: 22, left: 20),
              child: LineChart(title: 'Time - OOP', lineData: state is DataLoaded ? state.oop : null),
            ),
          ],
        );
      },
    );
  }
}