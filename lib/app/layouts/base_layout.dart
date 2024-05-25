import 'package:dashboard/entities/user/provider/provider.dart';
import 'package:dashboard/features/user/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/session/session.dart';
import '../../shared/constants/constants.dart';

final _navigationItems = [
  _NavigationItem(
    icon: const Icon(Icons.bar_chart),
    label: 'Показатели',
    path: Routes.indicators.path,
    actions: [],
  ),
  _NavigationItem(
    icon: const Icon(Icons.trending_up),
    label: 'Рейтинг магазинов',
    path: Routes.storeRating.path,
    actions: [],
  ),
  _NavigationItem(
    icon: const Icon(Icons.assignment_turned_in_outlined),
    label: 'Мои задачи',
    path: Routes.tasks.path,
    actions: [],
  ),
  _NavigationItem(
    icon: const Icon(Icons.forum_outlined),
    label: 'Сообщения',
    path: Routes.messages.path,
    actions: [],
  ),
  _NavigationItem(
    icon: const Icon(Icons.group),
    label: 'Подчинённые',
    path: Routes.users.path,
    actions: [],
  ),
];

class BaseLayout extends ConsumerWidget {
  const BaseLayout({
    super.key,
    required this.child,
    required this.currentPath,
  });

  final Widget child;
  final String currentPath;

  Future<void> onRefreshData(WidgetRef ref) async {
    switch (currentPath) {
      case '/users':
        ref.read(usersProvider.notifier).ref.invalidateSelf();
    }
  }

  List<Widget> _buildActions(BuildContext context) {
    switch (currentPath) {
      case '/users':
        return [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CreateUserDialog();
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ];
      default:
        return [];
    }
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            MenuAnchor(
              builder: (context, controller, child) {
                return IconButton(
                  onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                  padding: const EdgeInsets.all(5),
                  icon: const CircleAvatar(
                    child: Text('КБ'),
                  ),
                );
              },
              menuChildren: [
                MenuItemButton(
                  onPressed: () {},
                  leadingIcon: const Icon(Icons.person),
                  child: const Text('Профиль'),
                ),
                MenuItemButton(
                  onPressed: () async {
                    await ref.read(sessionProvider).signOut();
                  },
                  style: MenuItemButton.styleFrom(
                    foregroundColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                  leadingIcon: const Icon(Icons.logout),
                  child: const Text('Выход'),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text(_navigationItems[currentIndex].label),
          ],
        ),
        actions: [
          IconButton(onPressed: () => onRefreshData(ref), icon: const Icon(Icons.sync)),
          const SizedBox(width: 20),
          ..._buildActions(context),
          const SizedBox(width: 20),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (index) => context.go(_navigationItems[index].path),
            destinations: _navigationItems.map((item) {
              return NavigationRailDestination(
                icon: Badge(
                  isLabelVisible: item.path == Routes.messages.path,
                  label: const Text('7'),
                  child: item.icon,
                ),
                label: Text(item.label),
              );
            }).toList(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, WidgetRef ref, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_navigationItems[currentIndex].label),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefreshData(ref),
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => context.go(_navigationItems[index].path),
        items: _navigationItems.map((item) {
          return BottomNavigationBarItem(icon: item.icon, label: item.label);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _navigationItems.indexWhere((item) => item.path == currentPath);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return _buildDesktopLayout(context, ref, currentIndex);
        }
        return _buildMobileLayout(context, ref, currentIndex);
      },
    );
  }
}

class _NavigationItem {
  const _NavigationItem({required this.icon, required this.label, required this.path, required this.actions});

  final Widget icon;
  final String label;
  final String path;
  final List<Widget> actions;
}
