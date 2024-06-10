import 'package:dashboard/entities/indicator/indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/constants.dart';

final _format = NumberFormat("#,###");

class IndicatorCard extends StatelessWidget {
  const IndicatorCard({
    super.key,
    required this.indicator,
  });

  final IndicatorModel indicator;

  String _currentFormat(num number) {
    switch (indicator.type) {
      case 'count':
        return _format.format(number).replaceAll(',', ' ');

      case 'percent':
        return '${number.toStringAsFixed(1)}%';

      default:
        return '${_format.format(number)} ₽'.replaceAll(',', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final planPercent = double.parse(((indicator.fact / indicator.plan) * 100).toStringAsFixed(1));
    final lflPercent = double.parse(((indicator.fact / indicator.lfl) * 100).toStringAsFixed(1));
    final forecastPercent = indicator.forecast != null ? double.parse(((indicator.forecast! / indicator.plan) * 100).toStringAsFixed(1)) : null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(indicator.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              _currentFormat(indicator.fact),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: indicator.fact >= indicator.plan ? AppColors.green : AppColors.red),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 5,
                      height: (indicator.fact - indicator.plan) >= 0 ? 12.5 : 20,
                      color: AppColors.purple,
                      alignment: Alignment.bottomCenter,
                    ),
                    const SizedBox(width: 2),
                    Container(
                      width: 5,
                      height: (indicator.fact - indicator.plan) >= 0 ? 20 : 12.5,
                      color: (indicator.fact - indicator.plan) >= 0 ? AppColors.lightGreen : AppColors.red,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  '${indicator.plan == 0 ? 0 : (planPercent - 100).toStringAsFixed(1)}% (${(indicator.fact - indicator.plan) >= 0 ? '+' : ''}${(_currentFormat(indicator.fact - indicator.plan))})',
                  style: TextStyle(color: (indicator.fact - indicator.plan) >= 0 ? AppColors.green : AppColors.red),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 5,
                      height: (indicator.fact - indicator.lfl) >= 0 ? 12.5 : 20,
                      color: AppColors.gray,
                      alignment: Alignment.bottomCenter,
                    ),
                    const SizedBox(width: 2),
                    Container(
                      width: 5,
                      height: (indicator.fact - indicator.lfl) >= 0 ? 20 : 12.5,
                      color: (indicator.fact - indicator.lfl) >= 0 ? AppColors.lightGreen : AppColors.red,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  '${(lflPercent - 100).toStringAsFixed(1)}% (${(indicator.fact - indicator.lfl) >= 0 ? '+' : ''}${_currentFormat(indicator.fact - indicator.lfl)})',
                  style: TextStyle(color: (indicator.fact - indicator.lfl) >= 0 ? AppColors.green : AppColors.red),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Row(
                children: [
                  Text(
                    'Прогноз ${indicator.forecast != null ? _currentFormat(indicator.forecast!) : ''} (${forecastPercent ?? ''}%)',
                    style: TextStyle(color: forecastPercent == null ? Colors.transparent : AppColors.blue),
                  )
                ],
              ),
            ),
            Divider(thickness: 4, color: forecastPercent == null ? Colors.transparent : AppColors.blue),
            const SizedBox(height: 5),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(
                  value: indicator.plan == 0 ? 1 : planPercent / 100,
                  minHeight: 25,
                  color: indicator.fact >= indicator.plan ? AppColors.lightGreen : AppColors.red,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: indicator.fact >= indicator.plan ? Radius.zero : const Radius.circular(20)),
                ),
                Text('Факт ${_currentFormat(indicator.fact)}'),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(
                  value: indicator.plan / indicator.lfl,
                  minHeight: 25,
                  color: AppColors.purple,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: (indicator.plan / indicator.lfl) >= 1 ? Radius.zero : const Radius.circular(20)),
                ),
                Text('План ${_currentFormat(indicator.plan)} ${indicator.plan == 0 ? '' : '($planPercent%)'}'),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(
                  value: indicator.plan == 0 ? 1 : indicator.lfl / indicator.plan,
                  minHeight: 25,
                  color: AppColors.gray,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: (indicator.lfl / indicator.plan) >= 1 ? Radius.zero : const Radius.circular(20)),
                ),
                Text('LFL ${_currentFormat(indicator.lfl)} ($lflPercent%)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
