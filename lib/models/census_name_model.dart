import 'package:teste_dev_flutter/models/period_model.dart';

class CensusNameModel {
  final String name;
  final String? gender;
  final String locality;
  final List<PeriodModel> periods;

  CensusNameModel({
    required this.name,
    this.gender,
    required this.locality,
    required this.periods,
  });

  factory CensusNameModel.fromJson(Map<String, dynamic> json) {
    return CensusNameModel(
      name: json['nome'],
      gender: json['sexo'],
      locality: json['localidade'],
      periods: (json['res'] as List)
          .map((e) => PeriodModel.fromJson(e))
          .toList(),
    );
  }
}
