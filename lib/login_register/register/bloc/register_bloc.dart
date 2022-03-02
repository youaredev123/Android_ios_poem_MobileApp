import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final AuthenticationBloc authenticationBloc;

  RegisterBloc({@required this.authenticationBloc});
  
  @override
  RegisterState get initialState => InitialRegisterState();
  
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is Register) {
      yield RegisterLoading();
      await authenticationBloc.userRepository.register();
      yield RegisterSuccess();
      await Future.delayed(Duration(seconds: 1));
      yield InitialRegisterState();
    }
  }
}
