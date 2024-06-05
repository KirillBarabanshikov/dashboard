import 'package:dashboard/entities/drugstore/provider.dart';
import 'package:dashboard/features/drugstore/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreRatingPage extends ConsumerWidget {
  const StoreRatingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDrugstores = ref.watch(drugstoresProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: FilterList(
          //     items: const [Filters.plan, Filters.indicator, Filters.date, Filters.city, Filters.store, Filters.level, Filters.subordinate],
          //     onChange: (filters) => print(filters),
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
            sliver: asyncDrugstores.when(
              data: (data) {
                return SliverGrid.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 230,
                  ),
                  itemBuilder: (context, index) {
                    final drugstore = data[index];

                    return GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(drugstore.name),
                            content: ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 500, maxWidth: 500),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Бренд: ${drugstore.brand}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Регион: ${drugstore.region}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Город: ${drugstore.city}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Адрес: ${drugstore.address}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Описание:\n${drugstore.description}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.store, size: 30),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      drugstore.name,
                                      style: const TextStyle(
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
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CreateDrugstoreDialog(drugstore: drugstore);
                                            },
                                          );
                                        },
                                        leadingIcon: const Icon(Icons.edit),
                                        child: const Text('Изменить'),
                                      ),
                                      MenuItemButton(
                                        onPressed: () {
                                          ref.read(drugstoresProvider.notifier).delete(drugstore.id);
                                        },
                                        leadingIcon: const Icon(Icons.delete),
                                        child: const Text('Удалить'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Бренд: ${drugstore.brand}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Регион: ${drugstore.region}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Город: ${drugstore.city}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Адрес: ${drugstore.address}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return SliverToBoxAdapter(child: Text(error.toString()));
              },
              loading: () {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
