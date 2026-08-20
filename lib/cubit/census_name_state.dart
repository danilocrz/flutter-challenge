import 'package:teste_dev_flutter/models/census_name_model.dart';

abstract class CensusNameState {}

class CensusNameInitial extends CensusNameState {}

class CensusNameLoading extends CensusNameState {}

class CensusNameLoaded extends CensusNameState {
  final List<CensusNameModel> names;
  CensusNameLoaded(this.names);
}

class CensusNameError extends CensusNameState {
  final String message;
  CensusNameError(this.message);
}
