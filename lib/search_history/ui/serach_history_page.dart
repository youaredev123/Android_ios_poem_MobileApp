import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/search_history/bloc/search_history_repository.dart';
import 'package:poem_mobile/search_history/ui/search_hisotry_screen.dart';
import '../bloc/bloc.dart';

class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchHistoryBloc>(
      create: (context) => SearchHistoryBloc(authenticationBloc: BlocProvider.of<AuthenticationBloc>(context), searchHistoryRepository: SearchHistoryRepository())
      ..add(FetchHistory()),
      child: SearchHistoryScreen(),
    );
  }
}