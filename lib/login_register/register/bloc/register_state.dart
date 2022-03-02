import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => null;
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterFaild extends RegisterState {
  final String errorMsg;

  RegisterFaild(this.errorMsg);
}

class RegisterSuccess extends RegisterState {}