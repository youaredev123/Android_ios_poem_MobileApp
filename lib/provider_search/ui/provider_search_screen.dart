import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import '../bloc/bloc.dart';

class ProviderSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderSerachBloc, ProviderSerachState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: PoemAppBar(
                    title: 'Provider search',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
