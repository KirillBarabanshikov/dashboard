import 'package:flutter/material.dart';

import '../../features/filter/model/filter_model.dart';
import '../../features/filter/ui/list/filter_list.dart';
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
              items: const [Filters.date],
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
