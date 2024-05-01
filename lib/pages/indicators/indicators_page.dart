import 'package:flutter/material.dart';

import '../../features/filter/filter.dart';

class IndicatorsPage extends StatelessWidget {
  const IndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.date, Filters.lfl, Filters.city, Filters.store, Filters.level, Filters.subordinate],
              onChange: (filters) => print(filters),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            sliver: SliverGrid.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 310,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        const Text('Выручка', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        const Text('1 338 331 ₽', style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold)),
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
                                  color: const Color.fromRGBO(180, 125, 255, 1),
                                  alignment: Alignment.bottomCenter,
                                ),
                                const SizedBox(width: 3),
                                Container(
                                  width: 5,
                                  height: 15,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Text('-42.6% (-992 тыс. ₽)', style: TextStyle(color: Colors.red)),
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
                                  color: const Color.fromRGBO(225, 227, 224, 1),
                                  alignment: Alignment.bottomCenter,
                                ),
                                const SizedBox(width: 3),
                                Container(
                                  width: 5,
                                  height: 15,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Text('-36.5% (-769 тыс. ₽)', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Row(children: [Text('Прогноз 2 362 082 ₽ (101.4%)', style: TextStyle(color: Colors.blueAccent))]),
                        ),
                        const Divider(thickness: 4, color: Colors.blueAccent),
                        const SizedBox(height: 5),
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            LinearProgressIndicator(
                              value: 0.5,
                              minHeight: 25,
                              color: Color.fromRGBO(245, 66, 29, 1),
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
                              color: Color.fromRGBO(180, 125, 255, 1),
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
                              color: Color.fromRGBO(225, 227, 224, 1),
                              backgroundColor: Colors.transparent,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                            ),
                            Text('LFL 2 107 222 ₽ (63.5%)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
