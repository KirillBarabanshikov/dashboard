import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                                  padding: EdgeInsets.all(20),
                                  child: Text('Title', style: TextStyle(fontSize: 24)),
                                ),
                                const Divider(),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: const Text('Data'),
                                        trailing: const Icon(Icons.check),
                                        onTap: () {},
                                      );
                                    },
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(onPressed: () => context.pop(), child: const Text('Отменить')),
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
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                childAspectRatio: 16 / 9,
              ),
              itemBuilder: (context, index) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text('Выручка', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('1 338 331 ₽', style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('-42.6% (-992 тыс. ₽)', style: TextStyle(color: Colors.red)),
                        Text('-36.5% (-769 тыс. ₽)', style: TextStyle(color: Colors.red)),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Row(children: [Text('Прогноз 2 362 082 ₽ (101.4%)', style: TextStyle(color: Colors.blueAccent))]),
                        ),
                        Divider(thickness: 4, color: Colors.blueAccent),
                        SizedBox(height: 5),
                        Stack(
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
                        SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            LinearProgressIndicator(
                              value: 1,
                              minHeight: 25,
                              color: Color.fromRGBO(180, 125, 255, 1),
                              backgroundColor: Colors.transparent,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                            ),
                            Text('План 2 330 000 ₽ (57.4%)'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Stack(
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
