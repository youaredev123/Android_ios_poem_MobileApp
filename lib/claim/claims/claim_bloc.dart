import 'package:bloc/bloc.dart';
import 'package:poem_mobile/claim/claims/claims_repository.dart';
import 'package:poem_mobile/models/claim.dart';
import 'claims.dart';

class ClaimBloc extends Bloc<ClaimEvent, ClaimState> {
  
  final ClaimRepository claimRepository;
  
  ClaimBloc(this.claimRepository);
  
  @override
  ClaimState get initialState => Intial(claimTypeToShow, showPaid);
  
  String keyWord = '';
  bool showPaid = true;
  int page = 0;
  ClaimType claimTypeToShow = ClaimType.All;

  List<Claim> claims;
  
  @override
  Stream<ClaimState> mapEventToState(
    ClaimEvent event,
  ) async* {
    if(event is Fetch) {
      yield ClaimLoading();
      claims = await claimRepository.fetchClaims(claimTypeToShow, showPaid, keyWord);
      yield ClaimDataChanged(claims, claimTypeToShow, showPaid);
    } if(event is FetchMore) {
      yield ClaimLoadingMore();
      var moreclaims = await claimRepository.fetchMoreClaims(page, claimTypeToShow, showPaid, keyWord);
      claims.addAll(moreclaims);
      yield ClaimDataChanged(claims, claimTypeToShow, showPaid);
    } else if(event is ChangeClaimStatus) {
      yield ClaimLoading();
      showPaid = event.paid;
      page = 0;
      claims = await claimRepository.fetchClaims(claimTypeToShow, showPaid, keyWord);
      yield ClaimDataChanged(claims, claimTypeToShow, showPaid);
    } else if(event is ChangeClaimType) {
       yield ClaimLoading();
       claimTypeToShow = event.claimType;
       page = 0;
       claims = await claimRepository.fetchClaims(claimTypeToShow, showPaid, keyWord);
       yield ClaimDataChanged(claims, claimTypeToShow, showPaid);
    }
  }
}