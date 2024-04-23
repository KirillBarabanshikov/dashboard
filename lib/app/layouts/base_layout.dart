import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _navigationItems = [
  const _NavigationItem(icon: Icon(Icons.bar_chart), label: 'Показатели', path: '/'),
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

  @override
  Widget build(BuildContext context) {
    final currentIndex = _navigationItems.indexWhere((item) => item.path == currentPath);

    return Scaffold(
      appBar: AppBar(title: Text(_navigationItems[currentIndex].label)),
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
