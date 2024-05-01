class Indicator {
  const Indicator({
    required this.title,
    this.forecast,
    required this.fact,
    required this.plan,
    required this.lfl,
  });

  final String title;
  final int? forecast;
  final num fact;
  final num plan;
  final num lfl;
}
