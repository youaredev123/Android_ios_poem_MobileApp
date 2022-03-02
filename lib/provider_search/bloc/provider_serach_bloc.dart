import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ProviderSerachBloc extends Bloc<ProviderSerachEvent, ProviderSerachState> {
  @override
  ProviderSerachState get initialState => InitialProviderSerachState();

  @override
  Stream<ProviderSerachState> mapEventToState(
    ProviderSerachEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
