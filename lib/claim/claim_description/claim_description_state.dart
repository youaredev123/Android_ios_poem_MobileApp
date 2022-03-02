import 'package:equatable/equatable.dart';

abstract class ClaimDescriptionState extends Equatable {
  const ClaimDescriptionState();
}

class InitialClaimDescriptionState extends ClaimDescriptionState {
  @override
  List<Object> get props => [];
}
