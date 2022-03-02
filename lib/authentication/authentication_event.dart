import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:poem_mobile/authentication/authentication.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class CheckAuthenticationStatus extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  
  final Profile profile;

  const LoggedIn({@required this.profile});
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedIn { token: }';
}

class LoggedOut extends AuthenticationEvent {}