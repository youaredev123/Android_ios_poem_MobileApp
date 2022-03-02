import 'package:equatable/equatable.dart';

abstract class ProviderSerachState extends Equatable {
  const ProviderSerachState();
}

class InitialProviderSerachState extends ProviderSerachState {
  @override
  List<Object> get props => [];
}
