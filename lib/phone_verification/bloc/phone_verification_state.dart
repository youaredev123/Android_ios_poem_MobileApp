import 'package:equatable/equatable.dart';

abstract class PhoneVerificationState extends Equatable {
  const PhoneVerificationState();
  @override
  List<Object> get props => null;
}

class InitialPhoneVerificationState extends PhoneVerificationState {
  @override
  List<Object> get props => [];
}

class VerifyLoading extends PhoneVerificationState {} 

class VerifySuccess extends PhoneVerificationState {}

class VerifyFailure extends PhoneVerificationState {} 