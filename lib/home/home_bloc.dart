import 'package:bloc/bloc.dart';
import 'package:poem_mobile/home/home_repository.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  
  final HomeRepository homeRepository;
  
  HomeBloc(this.homeRepository);
  
  @override
  HomeState get initialState => DataEmpty();
  
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is Fetch) {
      yield* _mapFetchToState(event);
    }
  }
  
  Stream<HomeState> _mapFetchToState(Fetch event) async* {
    var deductible = await homeRepository.retrieveDeductibleData(event.userID);
    var oop = await homeRepository.retrieveOOPData(event.userID);
    var savingSummary = await homeRepository.retrieveSavingSummary(event.userID);
    yield DataLoaded(deductible: deductible, oop: oop, savingSummary: savingSummary);
  }
}
