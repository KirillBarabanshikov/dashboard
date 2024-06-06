import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/user/user.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> _filteredDrugstores = [];

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
          // SliverToBoxAdapter(
          //   child: FilterList(
          //     items: const [Filters.block],
          //     onChange: (filters) {
          //       print(filters['block']);
          //     },
          //   ),
          // ),
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
                }

                return SliverGrid.builder(
                  itemCount: _filteredDrugstores.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: (context, index) {
                    final user = _filteredDrugstores[index];
                    return UserCard(
                      user: user,
                      key: ValueKey(user.uid),
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
