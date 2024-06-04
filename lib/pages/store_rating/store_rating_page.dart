import 'package:flutter/material.dart';

import '../../features/filter/filter.dart';

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
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 230,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.store, size: 30),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'Медус 11',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            MenuAnchor(
                              builder: (context, controller, child) {
                                return IconButton(
                                  onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                                  icon: const Icon(Icons.more_vert),
                                );
                              },
                              menuChildren: [
                                MenuItemButton(
                                  onPressed: () {},
                                  leadingIcon: const Icon(Icons.edit),
                                  child: const Text('Изменить'),
                                ),
                                MenuItemButton(
                                  onPressed: () {},
                                  leadingIcon: const Icon(Icons.delete),
                                  child: const Text('Удалить'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Бренд: Бережная Аптека',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Регион: Удмуртия',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Город: Ижевск',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Адрес: Промышленная, 2',
                          style: TextStyle(
                            fontSize: 16,
                          ),
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
