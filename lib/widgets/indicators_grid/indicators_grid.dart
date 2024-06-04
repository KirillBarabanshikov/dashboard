import 'package:dashboard/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class IndicatorsGrid extends StatelessWidget {
  const IndicatorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildListDelegate([
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Выручка', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '1 338 331 ₽',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 2 362 082 (101.4%)',
                          style: TextStyle(color: AppColors.blue),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: AppColors.blue),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.45,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 1 338 331 ₽'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.zero),
                      ),
                      Text('План 2 330 000 ₽ (57.4%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('LFL 2 107 222 ₽ (63.5%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Кол-во продаж', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '2 393',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-44.6% (-1 924)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-47.3% (-2 149)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 4 409 (102.1%)',
                          style: TextStyle(color: AppColors.blue),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: AppColors.blue),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 2 393'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.85,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('План 4 317 (55.4%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('LFL 4 542 (52.7%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('SMART товары, уп.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '231',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-42.8% (-173)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-22% (-65)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 406 (100.5%)',
                          style: TextStyle(color: AppColors.blue),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: AppColors.blue),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 231'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.zero),
                      ),
                      Text('План 404 (57.2%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('LFL 296 (78%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Доля чеков со SMART-товарами', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '8.7%',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-3.1% (-0.6%)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-44.8% (+2.7%)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 406 (100.5%)',
                          style: TextStyle(color: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: Colors.transparent),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 8.7%'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.zero),
                      ),
                      Text('План 9.3% (93.9%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('LFL 6.0% (144.8%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('ВМТ,руб.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '628 224 ₽',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-43.2% (-478 тыс. ₽)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-36.6% (-363 тыс. ₽)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 1 123 395 (101.6%)',
                          style: TextStyle(color: AppColors.blue),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: AppColors.blue),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 628 224₽'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.zero),
                      ),
                      Text('План 1 105 901 ₽ (56.8%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('LFL 991 151 ₽ (63.4%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Доля ВМТ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '46.9%',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.green,
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
                      const Text('+0% (+46.9%)', style: TextStyle(color: AppColors.green)),
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
                      const Text('-2.7% (-1.3%)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 1 123 395 (101.6%)',
                          style: TextStyle(color: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: Colors.transparent),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.lightGreen,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Факт 46.9%'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.zero),
                      ),
                      Text('План 0%'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('LFL 48.2% (97.3%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('СМТ,руб.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '208 893 ₽',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-47% (-185 тыс. ₽)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-51.1% (-218 тыс. ₽)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 391 798 (99.5%)',
                          style: TextStyle(color: AppColors.blue),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: AppColors.blue),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 208 893₽'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('План 393 899 ₽ (53%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('LFL 426 912 ₽ (48.4%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Доля СМТ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '15.6%',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.red,
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
                      const Text('-7.6% (-1.3%)', style: TextStyle(color: AppColors.red)),
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
                      const Text('-23% (-4.7%)', style: TextStyle(color: AppColors.red)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 391 798 (99.5%)',
                          style: TextStyle(color: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: Colors.transparent),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 25,
                        color: AppColors.red,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('Факт 15.6%'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.7,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('План 16.9% (92.4%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('LFL 20.3% (77%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Text('Средний чек', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    '559 ₽',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.green,
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
                            color: AppColors.lightGreen,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      const Text('+3.5% (+19₽)', style: TextStyle(color: AppColors.green)),
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
                      const Text('+20.5% (+95,06₽)', style: TextStyle(color: AppColors.green)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Прогноз 391 798 (99.5%)',
                          style: TextStyle(color: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 4, color: Colors.transparent),
                  const SizedBox(height: 5),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.lightGreen,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Факт 559₽'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 1,
                        minHeight: 25,
                        color: AppColors.purple,
                        backgroundColor: Colors.transparent,
                      ),
                      Text('План 540₽ (103.5%)'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 25,
                        color: AppColors.gray,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                      ),
                      Text('LFL 463,94₽ (120.5%)'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 310,
        ));

    // return SliverGrid.builder(
    //   itemCount: indicatorsData.length,
    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 600,
    //     mainAxisSpacing: 20,
    //     crossAxisSpacing: 20,
    //     mainAxisExtent: 310,
    //   ),
    //   itemBuilder: (context, index) {
    //     final indicator = indicatorsData[index];
    //
    //     return IndicatorCard(indicator: indicator);
    //   },
    // );
  }
}
