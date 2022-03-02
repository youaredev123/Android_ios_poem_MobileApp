import 'package:equatable/equatable.dart';
import 'package:poem_mobile/member_profile/bloc/member_info_model.dart';

abstract class MemberInfoState extends Equatable {
  const MemberInfoState();

  @override
  List<Object> get props => null;
}

class InitialMemberInfoState extends MemberInfoState {
  @override
  List<Object> get props => [];
}

class MemberInfoReceived extends MemberInfoState {
  final MemberInfo memberInfo;

  MemberInfoReceived(this.memberInfo);
}