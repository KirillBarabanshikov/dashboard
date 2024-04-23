import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

const List<FilterItem> _filters = [
  FilterItem(
    name: 'plan',
    title: 'План',
    tiles: [
      FilterTile(title: 'План/Факт', value: 'План/Факт'),
      FilterTile(title: 'План/Прогноз', value: 'План/Прогноз'),
    ],
  ),
  FilterItem(
    name: 'indicator',
    title: 'Показатели',
    tiles: [
      FilterTile(title: 'Выручка', value: 'Выручка'),
      FilterTile(title: 'Кол-во продаж', value: 'Кол-во продаж'),
      FilterTile(title: 'SMART товары, уп.', value: 'SMART товары, уп.'),
      FilterTile(title: 'Доля чеков со SMART', value: 'Доля чеков со SMART'),
    ],
  ),
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

class StoreRatingPage extends StatefulWidget {
  const StoreRatingPage({super.key});

  @override
  State<StoreRatingPage> createState() => _StoreRatingPageState();
}

class _StoreRatingPageState extends State<StoreRatingPage> {
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
                          search: ['subordinate', 'indicator'].contains(filter.name),
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
          const SliverToBoxAdapter(child: Divider(height: 1)),
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: Table(
                border: TableBorder.symmetric(inside: const BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1))),
                columnWidths: const {
                  0: FixedColumnWidth(400),
                  1: FixedColumnWidth(140),
                  2: FixedColumnWidth(125),
                  3: FixedColumnWidth(190),
                  4: FixedColumnWidth(190),
                  5: FixedColumnWidth(130),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('РЕЙТИНГ ВЫРУЧКА', style: TextStyle(fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('Кол-во продаж', textAlign: TextAlign.center)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('Средний чек', textAlign: TextAlign.center)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('Кол-во товаров в чеке (шт)', textAlign: TextAlign.center)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('Кол-во позиций в чеке', textAlign: TextAlign.center)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('ВМТ, руб', textAlign: TextAlign.center)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(child: Text('ВМТ, руб', textAlign: TextAlign.center)),
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('1.'),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      'Ижевск, УР Ижевск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('1 339 015,4 ₽'),
                                    Text('57% (-990 984,6 ₽)', style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('2 395'),
                                Text('55%', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('559,09 ₽'),
                                Text('104%', style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('2,28'),
                                Text('100%', style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('1,84'),
                                Text('100%', style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
