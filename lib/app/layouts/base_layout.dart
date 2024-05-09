import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _navigationItems = [
  const _NavigationItem(icon: Icon(Icons.bar_chart), label: 'Показатели', path: '/indicators'),
  const _NavigationItem(icon: Icon(Icons.trending_up), label: 'Рейтинг магазинов', path: '/store-rating'),
];

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    required this.child,
    required this.currentPath,
  });

  final Widget child;
  final String currentPath;

  Widget _buildDesktopLayout(BuildContext context, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            MenuAnchor(
              builder: (context, controller, child) {
                return GestureDetector(
                  onTap: () => controller.isOpen ? controller.close() : controller.open(),
                  child: const CircleAvatar(
                    child: Text('КБ'),
                  ),
                );
              },
              menuChildren: [
                MenuItemButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Выход'),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text(_navigationItems[currentIndex].label),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sync)),
          const SizedBox(width: 20),
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_outlined)),
          const SizedBox(width: 20),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
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
              return NavigationRailDestination(icon: item.icon, label: Text(item.label));
            }).toList(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_navigationItems[currentIndex].label),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_outlined)),
          const SizedBox(width: 10),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          const SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future.delayed(const Duration(seconds: 1));
        },
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
  Widget build(BuildContext context) {
    final currentIndex = _navigationItems.indexWhere((item) => item.path == currentPath);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return _buildDesktopLayout(context, currentIndex);
        }
        return _buildMobileLayout(context, currentIndex);
      },
    );
  }
}

class _NavigationItem {
  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.path,
  });

  final Widget icon;
  final String label;
  final String path;
}
