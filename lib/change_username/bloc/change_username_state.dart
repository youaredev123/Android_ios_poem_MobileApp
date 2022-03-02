import 'package:equatable/equatable.dart';

abstract class ChangeUsernameState extends Equatable {
  const ChangeUsernameState();
}

class InitialChangeUsernameState extends ChangeUsernameState {
  @override
  List<Object> get props => [];
}
