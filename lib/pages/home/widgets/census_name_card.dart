import 'package:flutter/material.dart';
import 'package:teste_dev_flutter/models/census_name_model.dart';

class CensusNameCard extends StatelessWidget {
  final CensusNameModel name;
  final VoidCallback onTap;
  const CensusNameCard({required this.name, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            name.name[0],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          name.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('${name.locality} · ${name.periods.length} décadas'),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
