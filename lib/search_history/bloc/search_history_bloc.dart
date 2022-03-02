import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:poem_mobile/authentication/authentication.dart';
import 'package:poem_mobile/search_history/bloc/search_history_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  
  final AuthenticationBloc authenticationBloc;
  final SearchHistoryRepository searchHistoryRepository;
  
  SearchHistoryBloc({@required this.authenticationBloc, @required this.searchHistoryRepository});
  
  List<SearchHistory> historyList = [];
  List<int> concernedIds = [];
  
  @override
  SearchHistoryState get initialState => InitialSearchHistoryState();
  
  @override
  Stream<SearchHistoryState> mapEventToState(
    SearchHistoryEvent event,
  ) async* {
    yield Idle();
    if(event is FetchHistory) {
      yield* _mapFetchToState();
    } if(event is MarkAsConcern) {
      if(event.value == true) {
        concernedIds.add(event.providerID);
      } else {
        concernedIds.remove(event.providerID);
      }
      historyList.firstWhere((item) => item.providerId == event.providerID).hasConcern = event.value;
      yield HistoryDataChanged(historyList);
    } else if (event is Update) {
      yield UpdateLoading();
      await searchHistoryRepository.updateConcerns();
      yield UpdateSuccess();
      // yield UpdateFailure();
      await Future.delayed(Duration(seconds: 1));
      yield Idle();
    }
  }
  
  Stream<SearchHistoryState> _mapFetchToState() async* {
    
    yield FetchLoading();
    
    historyList = await searchHistoryRepository.searchHistory(authenticationBloc.state.profile.userID);
    for(int i = 0; i < historyList.length; i++) {
       if(concernedIds.contains(historyList[i].providerId)) {
        historyList[i].hasConcern = true;
      } else {
        historyList[i].hasConcern = false;
      }
    }
    yield HistoryDataChanged(historyList);
  }
}
