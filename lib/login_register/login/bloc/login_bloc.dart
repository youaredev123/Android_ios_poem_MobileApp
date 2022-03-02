import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthenticationBloc authenticationBloc;
  
  LoginBloc(this.authenticationBloc);
  
  @override
  LoginState get initialState => InitialLoginState();
   
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield* _mapLoginToState(event);
    }
  }
  
  Stream<LoginState> _mapLoginToState(Login event) async* {
    yield LoginLoading();
    Profile profile = await authenticationBloc.userRepository
        .login(username: event.userName, password: event.password);
    yield LoginSuccess();
    // yield LoginFailed(null);
    await Future.delayed(Duration(seconds: 1));
    yield InitialLoginState();
    authenticationBloc.add(LoggedIn(profile: profile));
  }
}
