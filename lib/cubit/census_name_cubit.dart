import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_dev_flutter/core/services/census_name_service.dart';
import 'package:teste_dev_flutter/cubit/census_name_state.dart';

class CensusNameCubit extends Cubit<CensusNameState> {
  final CensusNameService _service;
  CensusNameCubit(this._service) : super(CensusNameInitial());

  Future<void> fetchCensusName(String query) async {
    emit(CensusNameLoading());
    if (query.isEmpty) {
      emit(CensusNameInitial());
      return;
    }
    try {
      final names = await _service.fetchNames(query);
      emit(CensusNameLoaded(names));
    } catch (e) {
      emit(CensusNameError('Erro: $e'));
    }
  }
}
