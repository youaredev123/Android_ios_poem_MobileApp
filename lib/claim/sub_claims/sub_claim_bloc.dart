import 'package:bloc/bloc.dart';
import 'package:poem_mobile/claim/claims/claims_repository.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_event.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_state.dart';
import 'package:poem_mobile/models/models.dart';

class SubClaimBloc extends Bloc<SubClaimEvent, SubClaimState> {
  
  final int claimID;
  final ClaimRepository claimRepository;
  
  List<Claim> subClaims;
  
  SubClaimBloc(this.claimID, this.claimRepository);

  @override
  SubClaimState get initialState => Initial();
  
  @override
  Stream<SubClaimState> mapEventToState(
    SubClaimEvent event,
  ) async* {
    if(event is Fetch) {
      yield SubClaimLoading();
      subClaims = await claimRepository.fetchSubClaims(claimID);
      yield SubclaimDatachanged(subClaims);
    } if(event is FetchMore) {
      yield SubClaimLoadingMore();
      var _subClaims = await claimRepository.fetchMoreSubClaims(claimID);
      subClaims.addAll(_subClaims);
      yield SubclaimDatachanged(subClaims);
    }
  }
}