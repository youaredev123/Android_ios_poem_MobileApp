import 'package:equatable/equatable.dart';
import 'package:poem_mobile/models/claim.dart';

abstract class ClaimState extends Equatable {
  const ClaimState();
  
  @override
  List<Object> get props => [];
}

class Intial extends ClaimState {
  final ClaimType claimType;
  final bool showPaid;

  Intial(this.claimType, this.showPaid);
}

class Waiting extends ClaimState {}

class ClaimLoading extends ClaimState {}

class ClaimLoadingMore extends ClaimState {}

class ClaimDataChanged extends ClaimState {
  final List<Claim> claims;
  final ClaimType claimType;
  final bool showPaid;
  ClaimDataChanged(this.claims, this.claimType, this.showPaid);
}

