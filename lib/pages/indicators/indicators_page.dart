import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

const List<FilterItem> _filters = [
  FilterItem(
    name: 'date',
    title: 'Даты',
    tiles: [
      FilterTile(title: 'Сегодня', value: 'Сегодня'),
      FilterTile(title: 'Текущая неделя', value: 'Текущая неделя'),
      FilterTile(title: 'Текущий месяц по вчера', value: 'Текущий месяц по вчера'),
      FilterTile(title: 'Текущий месяц по сейчас', value: 'Текущий месяц по сейчас'),
      FilterTile(title: 'Текущий месяц', value: 'Текущий месяц'),
      FilterTile(title: 'Вчера', value: 'Вчера'),
      FilterTile(title: 'Прошлый месяц', value: 'Прошлый месяц'),
      FilterTile(title: 'Прошлая неделя', value: 'Прошлая неделя'),
      FilterTile(title: 'Актуальный период', value: 'Актуальный период'),
      FilterTile(title: 'Задать от и до', value: 'Задать от и до'),
    ],
  ),
  FilterItem(
    name: 'lfl',
    title: 'Сравнение с подобным периодом из прошлого',
    tiles: [
      FilterTile(title: 'LFL: Годовой', value: 'LFL: Годовой'),
      FilterTile(title: 'LFL: Ближайший переод', value: 'LFL: Ближайший переод'),
      FilterTile(title: 'LFL: Прошлый месяц', value: 'LFL: Прошлый месяц'),
    ],
  ),
  FilterItem(
    name: 'city',
    title: 'Города',
    tiles: [
      FilterTile(title: 'Все города', value: 'Все города'),
      FilterTile(title: 'Ижевск', value: 'Ижевск'),
    ],
  ),
  FilterItem(
    name: 'shop',
    title: 'Торговые точки',
    tiles: [
      FilterTile(title: 'Все тогровые точки', value: 'Все тогровые точки'),
      FilterTile(
        title: 'УР Ижеквск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
        value: 'УР Ижеквск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
      ),
    ],
  ),
  FilterItem(
    name: 'level',
    title: 'Уровни',
    tiles: [
      FilterTile(title: 'Все уровни', value: 'Все уровни'),
      FilterTile(title: 'Свои Заведующие аптеками', value: 'Свои Заведующие аптеками'),
      FilterTile(title: 'Все Заведующие аптеками', value: 'Все Заведующие аптеками'),
      FilterTile(title: 'Все СПС', value: 'Все СПС'),
    ],
  ),
  FilterItem(
    name: 'subordinate',
    title: 'Подчинённые',
    tiles: [
      FilterTile(title: 'Все подчинённые', value: 'Все подчинённые'),
      FilterTile(title: 'Бодяга Алёна Ивановна', value: 'Бодяга Алёна Ивановна'),
      FilterTile(title: 'Барабанщиков Кирилл Дмитриевич', value: 'Барабанщиков Кирилл Дмитриевич'),
    ],
  )
];

class IndicatorsPage extends StatefulWidget {
  const IndicatorsPage({super.key});

  @override
  State<IndicatorsPage> createState() => _IndicatorsPageState();
}

class _IndicatorsPageState extends State<IndicatorsPage> {
  final Map<String, String> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: _filters.length,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = _filters[index];

                  return OutlinedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return FilterDialog(
                          filterItem: filter,
                          search: filter.name == 'subordinate',
                          defaultValue: selectedFilters[filter.name],
                          onDone: (value) => setState(() {
                            selectedFilters[filter.name] = value;
                          }),
                        );
                      },
                    ),
                    child: Text(selectedFilters.containsKey(filter.name) ? selectedFilters[filter.name]! : filter.tiles.first.title),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
              ),
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
