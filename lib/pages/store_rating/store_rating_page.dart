import 'package:flutter/material.dart';

import '../../features/filter/filter.dart';
import '../../shared/constants/constants.dart';

class StoreRatingPage extends StatelessWidget {
  const StoreRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.plan, Filters.indicator, Filters.date, Filters.city, Filters.store, Filters.level, Filters.subordinate],
              onChange: (filters) => print(filters),
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
                children: [
                  const TableRow(
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
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text('1.'),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      'Ижевск, УР Ижевск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('1 339 015,4 ₽'),
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
                                        const Text('57% (-990 984,6 ₽)', style: TextStyle(color: AppColors.red, fontSize: 13)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('2 395'),
                                Text('55%', style: TextStyle(color: AppColors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('559,09 ₽'),
                                Text('104%', style: TextStyle(color: AppColors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('2,28'),
                                Text('100%', style: TextStyle(color: AppColors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('1,84'),
                                Text('100%', style: TextStyle(color: AppColors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: AppColors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: AppColors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: AppColors.red)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                Text('628 908,42 ₽'),
                                Text('57%', style: TextStyle(color: AppColors.red)),
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
