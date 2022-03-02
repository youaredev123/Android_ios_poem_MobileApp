import 'package:equatable/equatable.dart';

abstract class MemberInfoEvent extends Equatable {
  const MemberInfoEvent();

  @override
  List<Object> get props => null;
}

class FetchMemberInfo extends MemberInfoEvent {}