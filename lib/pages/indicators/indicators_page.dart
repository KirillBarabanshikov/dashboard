import 'package:flutter/material.dart';

import '../../features/filter/filter.dart';
import '../../widgets/widget.dart';

class IndicatorsPage extends StatelessWidget {
  const IndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.date, Filters.lfl, Filters.city, Filters.store, Filters.level, Filters.subordinate],
              onChange: (filters) => print(filters),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
            sliver: IndicatorsGrid(),
          ),
        ],
      ),
    );
  }
}
