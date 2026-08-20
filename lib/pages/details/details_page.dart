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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          final summaryCard = Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfo('Nome', census.name),
                  _buildInfo('Sexo', census.gender ?? 'Não informado'),
                  _buildInfo('Localidade', census.locality),
                  _buildInfo('Períodos', '${census.periods.length} décadas'),
                ],
              ),
            ),
          );

          final periodsList = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequência por Década',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
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
          );

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: summaryCard),
                      SizedBox(width: 16),
                      Expanded(flex: 3, child: periodsList),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [summaryCard, SizedBox(height: 24), periodsList],
                  ),
          );
        },
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
