import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/drugstore/drugstore.dart';
import '../model/model.dart';
import '../provider/provider.dart';

class DrugstoreCard extends ConsumerWidget {
  const DrugstoreCard({
    super.key,
    required this.drugstore,
    required this.isAdmin,
  });

  final DrugstoreModel drugstore;
  final bool isAdmin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
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
                      'Описание: ${drugstore.description!.isEmpty ? '-' : '\n${drugstore.description}'}',
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
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    if (isAdmin)
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
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Регион: ${drugstore.region}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Город: ${drugstore.city}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Адрес: ${drugstore.address}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
