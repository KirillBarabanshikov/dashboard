import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../model/model.dart';
import '../button/filter_button.dart';

class FilterList extends StatefulWidget {
  const FilterList({
    super.key,
    required this.items,
    required this.onChange,
  });

  final List<Filters> items;
  final void Function(Map<String, String> filters) onChange;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  final Map<String, String> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        itemCount: widget.items.length,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final filter = filterData.firstWhere((element) => element.name == widget.items[index].name);

          return FilterButton(
            filterItem: filter,
            selectedFilters: selectedFilters,
            onChange: (value) {
              setState(() {
                selectedFilters[filter.name] = value;
              });
              widget.onChange(selectedFilters);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
