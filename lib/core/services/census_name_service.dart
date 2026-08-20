import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste_dev_flutter/models/census_name_model.dart';

class CensusNameService {
  final String _baseUrl =
      'https://servicodados.ibge.gov.br/api/v2/censos/nomes';

  Future<List<CensusNameModel>> fetchNames(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => CensusNameModel.fromJson(e)).toList();
    }
    throw Exception('Erro ao buscar nomes (${response.statusCode})');
  }
}
