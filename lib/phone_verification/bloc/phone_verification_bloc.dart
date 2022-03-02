import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poem_mobile/phone_verification/bloc/phone_verification_repository.dart';
import './bloc.dart';

class PhoneVerificationBloc extends Bloc<PhoneVerificationEvent, PhoneVerificationState> {

  final PhoneVerificationRepository phoneVerificationRepository;
  
  PhoneVerificationBloc(this.phoneVerificationRepository);
  
  @override
  PhoneVerificationState get initialState => InitialPhoneVerificationState();
  
  @override
  Stream<PhoneVerificationState> mapEventToState(
    PhoneVerificationEvent event,
  ) async* {
    if(event is Verify) {
      yield VerifyLoading();
      await phoneVerificationRepository.verify(event.otpCode);
      yield VerifySuccess();
      await Future.delayed(Duration(seconds: 1));
      yield InitialPhoneVerificationState();
    }
  }
}
