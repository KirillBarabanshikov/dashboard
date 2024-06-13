import 'package:dashboard/entities/drugstore/drugstore.dart';
import 'package:dashboard/shared/ui/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/session/model/model.dart';
import '../../shared/services/hive_service.dart';

class DrugstoresPage extends ConsumerStatefulWidget {
  const DrugstoresPage({super.key});

  @override
  ConsumerState createState() => _DrugstoresPageState();
}

class _DrugstoresPageState extends ConsumerState<DrugstoresPage> {
  final TextEditingController _searchController = TextEditingController();
  List<DrugstoreModel> _filteredDrugstores = [];
  int _currentPage = 1;
  final _limit = 8;
  late SessionUser sessionUser;

  @override
  void initState() {
    super.initState();
    sessionUser = HiveService.getSessionUser();
  }

  void _filterDrugstores(String query) {
    final allDrugstores = ref.read(drugstoresProvider).value;
    if (query.isNotEmpty) {
      _filteredDrugstores = allDrugstores!.where((drugstore) {
        return drugstore.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _filteredDrugstores = _filteredDrugstores.sublist(0, _filteredDrugstores.length >= _limit ? _limit : null);
    } else {
      _filteredDrugstores = allDrugstores!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final asyncDrugstores = ref.watch(drugstoresProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            sliver: SliverToBoxAdapter(
              child: TextField(
                decoration: const InputDecoration(labelText: 'Поиск по названию'),
                controller: _searchController,
                onChanged: (value) => _filterDrugstores(value),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
            sliver: asyncDrugstores.when(
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
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    final drugstore = _filteredDrugstores[index];

                    return DrugstoreCard(
                      drugstore: drugstore,
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
          if (asyncDrugstores.hasValue)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: MyPagination(
                    currentPage: _currentPage,
                    pageNumber: (asyncDrugstores.value!.length / _limit).ceil(),
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
