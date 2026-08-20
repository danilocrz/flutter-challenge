import 'package:flutter/material.dart';
import 'package:teste_dev_flutter/models/census_name_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final census =
        ModalRoute.of(context)!.settings.arguments as CensusNameModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(census.name, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Card de resumo
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfo('Nome', census.name),
                      _buildInfo('Sexo', census.gender ?? 'Não informado'),
                      _buildInfo('Localidade', census.locality),
                      _buildInfo(
                        'Períodos',
                        '${census.periods.length} décadas',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // 3. Título da seção de períodos
              Text(
                'Frequência por Década',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // 4. Lista de períodos
              ...census.periods.map(
                (period) => Card(
                  child: ListTile(
                    title: Text(period.displayPeriod),
                    trailing: Text(
                      period.frequency.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
