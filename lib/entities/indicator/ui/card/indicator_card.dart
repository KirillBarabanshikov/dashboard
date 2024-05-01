import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/constants/constants.dart';
import '../../model/model.dart';

final currencyFormat = NumberFormat.currency(locale: 'ru', symbol: '₽', decimalDigits: 0);

class IndicatorCard extends StatelessWidget {
  const IndicatorCard({
    super.key,
    required this.indicator,
  });

  final Indicator indicator;

  String _currentFormat(num number) {
    if (number is int) {
      return currencyFormat.format(number);
    }
    return '$number%';
  }

  @override
  Widget build(BuildContext context) {
    final String fact = _currentFormat(indicator.fact);
    final String plan = _currentFormat(indicator.plan);
    final String lfl = _currentFormat(indicator.lfl);
    final String? forecast = indicator.forecast != null ? _currentFormat(indicator.forecast!) : null;
    final isPositive = indicator.fact > indicator.plan;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(indicator.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              fact,
              style: TextStyle(
                fontSize: 24,
                color: isPositive ? AppColors.green : AppColors.red,
                fontWeight: FontWeight.bold,
              ),
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
                      height: 20,
                      color: AppColors.purple,
                      alignment: Alignment.bottomCenter,
                    ),
                    const SizedBox(width: 3),
                    Container(
                      width: 5,
                      height: 15,
                      color: AppColors.red,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Text('-42.6% (-992 тыс. ₽)', style: TextStyle(color: AppColors.red)),
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
                      height: 20,
                      color: AppColors.gray,
                      alignment: Alignment.bottomCenter,
                    ),
                    const SizedBox(width: 3),
                    Container(
                      width: 5,
                      height: 15,
                      color: AppColors.red,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Text('-36.5% (-769 тыс. ₽)', style: TextStyle(color: AppColors.red)),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Row(
                children: [
                  Text(
                    'Прогноз $forecast (101.4%)',
                    style: TextStyle(color: forecast != null ? AppColors.blue : Colors.transparent),
                  )
                ],
              ),
            ),
            Divider(thickness: 4, color: forecast != null ? AppColors.blue : Colors.transparent),
            const SizedBox(height: 5),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(
                  value: 0.5,
                  minHeight: 25,
                  color: isPositive ? AppColors.lightGreen : AppColors.red,
                  backgroundColor: Colors.transparent,
                  borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
                ),
                Text('Факт $fact'),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                const LinearProgressIndicator(
                  value: 1,
                  minHeight: 25,
                  color: AppColors.purple,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: Radius.zero),
                ),
                Text('План $plan (57.4%)'),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                const LinearProgressIndicator(
                  value: 0.8,
                  minHeight: 25,
                  color: AppColors.gray,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                ),
                Text('LFL $lfl (63.5%)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
