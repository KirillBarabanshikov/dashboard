import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../dialog/filter_dialog.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.filterItem,
    required this.selectedFilters,
    required this.onChange,
  });

  final FilterItem filterItem;
  final Map<String, String> selectedFilters;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return FilterDialog(
            filterItem: filterItem,
            defaultValue: selectedFilters[filterItem.name],
            onChange: onChange,
          );
        },
      ),
      child: Text(selectedFilters.containsKey(filterItem.name)
          ? filterItem.tiles.firstWhere((element) => element.value == selectedFilters[filterItem.name]).title
          : filterItem.tiles.first.title),
    );
  }
}
