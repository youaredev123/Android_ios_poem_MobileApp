import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:poem_mobile/authentication/user_repository.dart';
import 'authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  
  final UserRepository userRepository;

  Timer _splashTimer;
  
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);
  
  @override
  AuthenticationState get initialState => AuthenticationUninitialized(null);
  
  @override
  Future<void> close() {
    _splashTimer?.cancel();
    return super.close();
  } 
  
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUninitialized(null);
      _splashTimer = Timer.periodic(Duration(seconds: 3), (timer) {
        if(timer.tick == 1) {
          add(CheckAuthenticationStatus());
          _splashTimer.cancel();
        }
      });
    }
    if(event is CheckAuthenticationStatus) {
      
      final bool loggedIn = userRepository.isLogedIn();
      
      if (loggedIn) {
        Profile userProfile = userRepository.loadSession();
        yield AuthenticationAuthenticated(userProfile);
      } else {
        yield AuthenticationUnauthenticated(null);
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationAuthenticated(event.profile);
      // yield AuthenticationLoading();
      userRepository.saveSession(event.profile);
    }
    
    if (event is LoggedOut) {
      // yield AuthenticationLoading();
      userRepository.deleteSession();
      yield AuthenticationUnauthenticated(null);
    }
  }
}