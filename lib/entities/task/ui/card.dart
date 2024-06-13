import 'package:dashboard/entities/task/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/task/create/ui/dialog/task_create_dialog.dart';
import '../../user/ui/avatar/user_avatar.dart';
import '../provider/provider.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.displayName,
  });

  final TaskModel task;
  final String? displayName;

  Future<void> changeStatus(String id, String status, BuildContext context, WidgetRef ref) async {
    await ref.read(tasksProvider(displayName: displayName).notifier).editStatus(id, status);
    if (context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  children: [
                    Text(
                      task.type,
                      style: TextStyle(
                        color: task.type == 'СРОЧНО'
                            ? Colors.red
                            : task.type == 'ПОЗЖЕ'
                                ? Colors.orangeAccent
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(task.title),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: task.status == 'Новая'
                            ? Colors.grey.withOpacity(0.2)
                            : task.status == 'В процессе'
                                ? Colors.orangeAccent.withOpacity(0.2)
                                : Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        task.status,
                        style: TextStyle(
                          color: task.status == 'Новая'
                              ? Colors.grey.withOpacity(0.9)
                              : task.status == 'В процессе'
                                  ? Colors.orangeAccent.withOpacity(0.9)
                                  : Colors.green.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                    minWidth: 500,
                  ),
                  child: Text(
                    task.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                actions: [
                  if (task.status == 'Новая') ...[
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'В процессе', context, ref),
                      child: const Text('В процессе'),
                    ),
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'Сделано', context, ref),
                      child: const Text('Сделано'),
                    ),
                  ],
                  if (task.status == 'В процессе') ...[
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'Новая', context, ref),
                      child: const Text('Новая'),
                    ),
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'Сделано', context, ref),
                      child: const Text('Сделано'),
                    ),
                  ],
                  if (task.status == 'Сделано') ...[
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'Новая', context, ref),
                      child: const Text('Новая'),
                    ),
                    TextButton(
                      onPressed: () => changeStatus(task.id, 'В процессе', context, ref),
                      child: const Text('В процессе'),
                    ),
                  ],
                ],
              );
            },
          );
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      task.type,
                      style: TextStyle(
                          color: task.type == 'СРОЧНО'
                              ? Colors.red
                              : task.type == 'ПОЗЖЕ'
                                  ? Colors.orangeAccent
                                  : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 5),
                    Expanded(child: Text(task.date)),
                    if (displayName == null)
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
                                  return CreateTaskDialog(
                                    task: task,
                                  );
                                },
                              );
                            },
                            leadingIcon: const Icon(Icons.edit),
                            child: const Text('Изменить'),
                          ),
                          MenuItemButton(
                            onPressed: () async {
                              await ref.read(tasksProvider(displayName: null).notifier).delete(task.id);
                            },
                            leadingIcon: const Icon(Icons.delete),
                            child: const Text('Удалить'),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 15),
                Text(
                  task.description,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 4,
                ),
                const Expanded(child: SizedBox()),
                const Divider(height: 25),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: task.status == 'Новая'
                            ? Colors.grey.withOpacity(0.2)
                            : task.status == 'В процессе'
                                ? Colors.orangeAccent.withOpacity(0.2)
                                : Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        task.status,
                        style: TextStyle(
                          color: task.status == 'Новая'
                              ? Colors.grey.withOpacity(0.9)
                              : task.status == 'В процессе'
                                  ? Colors.orangeAccent.withOpacity(0.9)
                                  : Colors.green.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    if (displayName == null) ...[
                      Tooltip(
                        message: task.user.displayName,
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: UserAvatar(displayName: task.user.displayName, photoUrl: task.user.photoUrl),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          task.user.displayName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
