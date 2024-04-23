import 'package:flutter/material.dart';

class IndicatorsPage extends StatelessWidget {
  const IndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: 6,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return OutlinedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Text('Title'),
                                ),
                                const Divider(),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return const ListTile(title: Text('Data'));
                                    },
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(onPressed: () {}, child: const Text('Отменить')),
                                      const SizedBox(width: 15),
                                      TextButton(onPressed: () {}, child: const Text('Готово')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    child: const Text('Текущий месяц'),
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
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                mainAxisExtent: 400,
              ),
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ),
        ],
      ),
    );
  }
}
