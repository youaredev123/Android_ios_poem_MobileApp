import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class MemberInfoBloc extends Bloc<MemberInfoEvent, MemberInfoState> {

  final MemberInfoRepository memberInfoRepository;
  final AuthenticationBloc authenticationBloc;

  MemberInfoBloc({@required this.memberInfoRepository, @required this.authenticationBloc});
  
  @override
  MemberInfoState get initialState => InitialMemberInfoState();
  
  @override
  Stream<MemberInfoState> mapEventToState(
    MemberInfoEvent event,
  ) async* {
    if(event is FetchMemberInfo) {
       MemberInfo memberInfo = await memberInfoRepository.getMemberInfo(authenticationBloc.state.profile.userID);
       yield MemberInfoReceived(memberInfo);
    }
  }
}
