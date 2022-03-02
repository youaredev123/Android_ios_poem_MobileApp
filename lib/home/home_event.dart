import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  
  @override
  List<Object> get props => [];
}

class Fetch extends HomeEvent {
  final int userID;

  Fetch(this.userID);
}
