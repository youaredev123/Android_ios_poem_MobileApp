import 'package:equatable/equatable.dart';
import 'package:poem_mobile/home/models/point_per_year.dart';
import 'package:poem_mobile/home/models/saving_summary.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class Idle extends HomeState {}

class DataEmpty extends HomeState {}

class DataLoaded extends HomeState {
  
  final List<List<PointsPerYear>> deductible;
  final List<List<PointsPerYear>> oop;
  final SavingSummary savingSummary;
  
  DataLoaded({this.deductible, this.oop, this.savingSummary});
}

class TabSelected extends HomeState {
  final int tabIndex;

  TabSelected(this.tabIndex);
}

class LoadError extends HomeState {
  final String errorMsg;
  
  LoadError(this.errorMsg);
}

