class AssetVariation {
  AssetVariation({
    required this.day,
    required this.date,
    required this.value,
    required this.lastVariation,
    required this.firstVariation,
  });

  final int day;
  final DateTime date;
  final double value;
  final double? lastVariation;
  final double? firstVariation;
}
