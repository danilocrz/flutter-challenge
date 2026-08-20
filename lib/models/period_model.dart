class PeriodModel {
  final String period;
  final int frequency;

  PeriodModel({required this.period, required this.frequency});

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    return PeriodModel(period: json['periodo'], frequency: json['frequencia']);
  }

  String get displayPeriod {
    final cleaned = period
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(',', ' - ');

    if (!cleaned.contains(' - ')) return 'Antes de $cleaned';
    return cleaned;
  }
}
