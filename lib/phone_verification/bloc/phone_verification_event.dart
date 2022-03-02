import 'package:equatable/equatable.dart';

abstract class PhoneVerificationEvent extends Equatable {
  const PhoneVerificationEvent();

  @override
  List<Object> get props => null;
}

class Verify extends PhoneVerificationEvent {
  final String otpCode;

  Verify(this.otpCode);
}
