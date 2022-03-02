import 'package:equatable/equatable.dart';
import 'package:poem_mobile/models/models.dart';

abstract class SubClaimState extends Equatable {
  const SubClaimState();
  @override
  List<Object> get props => null;
}

class Initial extends SubClaimState {}

class SubClaimLoading extends SubClaimState {}

class SubClaimLoadingMore extends SubClaimState {}

class SubclaimDatachanged extends SubClaimState {

  final List<Claim> subClaims;

  SubclaimDatachanged(this.subClaims);
}