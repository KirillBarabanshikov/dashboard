import 'dart:async';

import 'package:dashboard/entities/task/provider.dart';
import 'package:dashboard/features/task/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/task/model.dart';
import '../../features/filter/model/filter_model.dart';
import '../../features/filter/ui/list/filter_list.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  List<TaskModel> _filteredTasks = [];
  Map<String, String> selectedFilter = {};

  void _filterTasks(Map<String, String> filter) {
    final allTasks = ref.read(tasksProvider).value;
    selectedFilter = filter;
    if (filter.isNotEmpty) {
      _filteredTasks = allTasks!.where((task) {
        if ((filter['status'] != null && filter['status']!.isNotEmpty) && (filter['type'] != null && filter['type']!.isNotEmpty)) {
          return (task.status == filter['status'] && task.type == filter['type']);
        }
        if ((filter['status'] != null && filter['status']!.isNotEmpty)) {
          return (task.status == filter['status']);
        }
        if ((filter['type'] != null && filter['type']!.isNotEmpty)) {
          return task.type == filter['type'];
        }
        return true;
      }).toList();
    } else {
      _filteredTasks = allTasks!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final asyncTasks = ref.watch(tasksProvider);

    Future<void> changeStatus(String id, String status, BuildContext context) async {
      await ref.read(tasksProvider.notifier).editStatus(id, status);
      if (context.mounted) context.pop();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.status, Filters.type],
              onChange: (filters) => _filterTasks(filters),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
              sliver: asyncTasks.when(
                data: (data) {
                  _filteredTasks = data;
                  _filterTasks(selectedFilter);

                  return SliverGrid.builder(
                    itemCount: _filteredTasks.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 310,
                    ),
                    itemBuilder: (context, index) {
                      final task = _filteredTasks[index];

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
                                        onPressed: () => changeStatus(task.id, 'В процессе', context),
                                        child: const Text('В процессе'),
                                      ),
                                      TextButton(
                                        onPressed: () => changeStatus(task.id, 'Сделано', context),
                                        child: const Text('Сделано'),
                                      ),
                                    ],
                                    if (task.status == 'В процессе') ...[
                                      TextButton(
                                        onPressed: () => changeStatus(task.id, 'Новая', context),
                                        child: const Text('Новая'),
                                      ),
                                      TextButton(
                                        onPressed: () => changeStatus(task.id, 'Сделано', context),
                                        child: const Text('Сделано'),
                                      ),
                                    ],
                                    if (task.status == 'Сделано') ...[
                                      TextButton(
                                        onPressed: () => changeStatus(task.id, 'Новая', context),
                                        child: const Text('Новая'),
                                      ),
                                      TextButton(
                                        onPressed: () => changeStatus(task.id, 'В процессе', context),
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
                                              await ref.read(tasksProvider.notifier).delete(task.id);
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
                                      // for (var user in task.users)
                                      //   Row(
                                      //     children: [
                                      //       Tooltip(
                                      //         message: user,
                                      //         child: SizedBox(
                                      //           width: 35,
                                      //           height: 35,
                                      //           child: UserAvatar(displayName: user),
                                      //         ),
                                      //       ),
                                      //       const SizedBox(width: 5),
                                      //     ],
                                      //   ),
                                      // SizedBox(
                                      //   width: 35,
                                      //   height: 35,
                                      //   child: CircleAvatar(
                                      //     backgroundColor: Colors.black.withOpacity(0.4),
                                      //     child: const Text(
                                      //       '+9',
                                      //       style: TextStyle(color: Colors.white),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
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
              )),
        ],
      ),
    );
  }
}
