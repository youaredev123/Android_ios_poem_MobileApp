import 'package:equatable/equatable.dart';
import 'package:poem_mobile/models/claim.dart';

abstract class ClaimEvent extends Equatable {
  const ClaimEvent();
  @override
  List<Object> get props => [];
}

class Fetch extends ClaimEvent {}

class FetchMore extends ClaimEvent {}

class ChangeClaimType extends ClaimEvent {
  final ClaimType claimType;

  ChangeClaimType(this.claimType);
}

class ChangeClaimStatus extends ClaimEvent {
  final bool paid;
  ChangeClaimStatus(this.paid);
}

class ChangKeyword extends ClaimEvent {
  final String keyWord;
 
  ChangKeyword(this.keyWord);
}