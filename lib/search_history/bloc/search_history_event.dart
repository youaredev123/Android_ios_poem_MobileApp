import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchHistoryEvent extends Equatable {
  const SearchHistoryEvent();

  @override
  List<Object> get props => null;
}

class FetchHistory extends SearchHistoryEvent {}

class MarkAsConcern extends SearchHistoryEvent {

  final int providerID;
  final bool value;

  MarkAsConcern({@required this.providerID, @required this.value});
}

class Update extends SearchHistoryEvent {}

class Cancel extends SearchHistoryEvent {}