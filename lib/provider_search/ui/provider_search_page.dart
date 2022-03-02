import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/provider_search/ui/provider_search_screen.dart';
import '../bloc/bloc.dart';

class ProviderSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProviderSerachBloc>(
      create: (context) => ProviderSerachBloc(),
      child: ProviderSearchScreen(),
    );
  }
}