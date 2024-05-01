import 'package:flutter/material.dart';

import '../../entities/indicator/indicator.dart';

class IndicatorsGrid extends StatelessWidget {
  const IndicatorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: indicatorsData.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 600,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 310,
      ),
      itemBuilder: (context, index) {
        final indicator = indicatorsData[index];

        return IndicatorCard(indicator: indicator);
      },
    );
  }
}
