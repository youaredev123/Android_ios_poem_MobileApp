import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ChangeUsernameBloc extends Bloc<ChangeUsernameEvent, ChangeUsernameState> {
  @override
  ChangeUsernameState get initialState => InitialChangeUsernameState();

  @override
  Stream<ChangeUsernameState> mapEventToState(
    ChangeUsernameEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
