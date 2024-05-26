import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/user/user.dart';
import '../../features/filter/filter.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUsers = ref.watch(usersProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.block],
              onChange: (filters) {
                print(filters['block']);
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            sliver: asyncUsers.when(
              data: (data) {
                return SliverGrid.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return UserCard(user: user);
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
