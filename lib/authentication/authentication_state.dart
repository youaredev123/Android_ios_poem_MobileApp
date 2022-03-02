import 'package:equatable/equatable.dart';
import 'authentication.dart';

abstract class AuthenticationState extends Equatable {
  
  final Profile profile;

  AuthenticationState(this.profile);
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {
  AuthenticationUninitialized(Profile profile) : super(profile);
}

class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated(Profile profile) : super(profile);
}

class AuthenticationUnauthenticated extends AuthenticationState {
  AuthenticationUnauthenticated(Profile profile) : super(profile);
}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading(Profile profile) : super(profile);
}