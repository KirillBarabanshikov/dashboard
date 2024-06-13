import 'package:dashboard/entities/session/model/model.dart';
import 'package:dashboard/shared/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/user/user.dart';
import '../../shared/ui/pagination.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> _filteredDrugstores = [];
  int _currentPage = 1;
  final _limit = 8;
  late SessionUser sessionUser;

  @override
  void initState() {
    super.initState();
    sessionUser = HiveService.getSessionUser();
  }

  void _filterDrugstores(String query) {
    final allDrugstores = ref.read(usersProvider).value;
    if (query.isNotEmpty) {
      _filteredDrugstores = allDrugstores!.where((drugstore) {
        return drugstore.displayName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredDrugstores = allDrugstores!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final asyncUsers = ref.watch(usersProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            sliver: SliverToBoxAdapter(
              child: TextField(
                decoration: const InputDecoration(labelText: 'Поиск'),
                controller: _searchController,
                onChanged: (value) => _filterDrugstores(value),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
            sliver: asyncUsers.when(
              data: (data) {
                _filteredDrugstores = data;
                if (_searchController.text.isNotEmpty) {
                  _filterDrugstores(_searchController.text);
                } else {
                  final start = _limit * _currentPage - _limit;
                  final end = start + _limit;
                  _filteredDrugstores = _filteredDrugstores.sublist(start, end < _filteredDrugstores.length ? end : _filteredDrugstores.length);
                }

                return SliverGrid.builder(
                  itemCount: _filteredDrugstores.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 290,
                  ),
                  itemBuilder: (context, index) {
                    final user = _filteredDrugstores[index];
                    return UserCard(
                      user: user,
                      key: ValueKey(user.uid),
                      isAdmin: sessionUser.role == 'Администратор',
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
            ),
          ),
          if (asyncUsers.hasValue)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: MyPagination(
                    currentPage: _currentPage,
                    pageNumber: (asyncUsers.value!.length / _limit).ceil(),
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
