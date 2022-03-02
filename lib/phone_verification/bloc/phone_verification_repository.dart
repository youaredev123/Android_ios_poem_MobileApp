
class PhoneVerificationRepository {
  Future<bool> verify(String otpCode) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  } 
}