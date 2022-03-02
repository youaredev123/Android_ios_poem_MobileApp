import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ClaimDescriptionBloc extends Bloc<ClaimDescriptionEvent, ClaimDescriptionState> {
  @override
  ClaimDescriptionState get initialState => InitialClaimDescriptionState();

  @override
  Stream<ClaimDescriptionState> mapEventToState(
    ClaimDescriptionEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
