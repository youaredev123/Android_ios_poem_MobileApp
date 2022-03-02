import 'package:equatable/equatable.dart';

abstract class SubClaimEvent extends Equatable {
  const SubClaimEvent();
  @override
  List<Object> get props => null;
}

class Fetch extends SubClaimEvent {}

class FetchMore extends SubClaimEvent {}