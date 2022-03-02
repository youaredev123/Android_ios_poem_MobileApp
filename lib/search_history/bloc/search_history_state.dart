import 'package:equatable/equatable.dart';
import 'package:poem_mobile/search_history/bloc/bloc.dart';

abstract class SearchHistoryState extends Equatable {
  const SearchHistoryState();

  @override
  List<Object> get props => null;
}

class InitialSearchHistoryState extends SearchHistoryState {
  @override
  List<Object> get props => [];
}

class HistoryDataChanged extends SearchHistoryState {

  final List<SearchHistory> historyList;

  HistoryDataChanged(this.historyList);

}

class Idle extends SearchHistoryState {}

class FetchLoading extends SearchHistoryState {}

class UpdateLoading extends SearchHistoryState {}

class UpdateSuccess extends SearchHistoryState {}

class UpdateFailure extends SearchHistoryState {}

class CancelLoading extends SearchHistoryState {}

class CancelSuccess extends SearchHistoryState {} 

class CancelFailure extends SearchHistoryState {}