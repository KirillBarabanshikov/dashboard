import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/indicator/indicator.dart';
import '../../features/filter/filter.dart';

class IndicatorsPage extends ConsumerStatefulWidget {
  const IndicatorsPage({super.key});

  @override
  ConsumerState createState() => _IndicatorsPageState();
}

class _IndicatorsPageState extends ConsumerState<IndicatorsPage> {
  String currentFilter = 'today';

  void onChange(String filter) async {
    setState(() {
      currentFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncIndicators = ref.watch(indicatorsProvider(currentFilter));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilterList(
              items: const [Filters.date],
              onChange: (filters) => onChange(filters['date']!),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            sliver: asyncIndicators.when(
              data: (indicators) {
                return SliverGrid.builder(
                  itemCount: indicators.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: (context, index) {
                    final indicator = indicators[index];
                    return IndicatorCard(indicator: indicator);
                  },
                );
              },
              error: (error, stackTrace) => SliverToBoxAdapter(child: Text(error.toString())),
              loading: () => const SliverFillRemaining(hasScrollBody: false, child: Center(child: CircularProgressIndicator())),
            ),
          ),
        ],
      ),
    );
  }
}
