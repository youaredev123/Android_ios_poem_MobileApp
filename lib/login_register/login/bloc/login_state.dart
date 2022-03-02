import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => null;
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {
  final String errorMsg;

  LoginFailed(this.errorMsg);
}

class LoginSuccess extends LoginState {}