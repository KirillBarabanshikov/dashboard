import 'package:dashboard/entities/session/model/model.dart';
import 'package:dashboard/entities/task/task.dart';
import 'package:dashboard/shared/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/filter/model/filter_model.dart';
import '../../features/filter/ui/list/filter_list.dart';
import '../../shared/ui/pagination.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  List<TaskModel> _filteredTasks = [];
  Map<String, String> selectedFilter = {};
  int _currentPage = 1;
  final _limit = 8;
  late SessionUser sessionUser;

  @override
  void initState() {
    super.initState();
    sessionUser = HiveService.getSessionUser();
  }

  void _filterTasks(Map<String, String> filter) {
    final allTasks = ref.read(tasksProvider(displayName: sessionUser.role == 'Администратор' ? null : sessionUser.displayName)).value;
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
      _filteredTasks = _filteredTasks.sublist(0, _filteredTasks.length >= _limit ? _limit : null);
    } else {
      _filteredTasks = allTasks!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final asyncTasks = ref.watch(tasksProvider(displayName: sessionUser.role == 'Администратор' ? null : sessionUser.displayName));

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
                  if ((selectedFilter['status'] != null && selectedFilter['status'] != '') ||
                      (selectedFilter['type'] != null && selectedFilter['type'] != '')) {
                    _filterTasks(selectedFilter);
                  } else {
                    final start = _limit * _currentPage - _limit;
                    final end = start + _limit;
                    _filteredTasks = _filteredTasks.sublist(start, end < _filteredTasks.length ? end : _filteredTasks.length);
                  }

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
                      return TaskCard(
                        task: task,
                        displayName: sessionUser.role == 'Администратор' ? null : sessionUser.displayName,
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return SliverToBoxAdapter(child: Text(error.toString()));
                },
                loading: () {
                  return const SliverFillRemaining(hasScrollBody: false, child: Center(child: CircularProgressIndicator()));
                },
              )),
          if (asyncTasks.hasValue)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: MyPagination(
                    currentPage: _currentPage,
                    pageNumber: (asyncTasks.value!.length / _limit).ceil(),
                    onChange: (page) => setState(() => _currentPage = page),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
