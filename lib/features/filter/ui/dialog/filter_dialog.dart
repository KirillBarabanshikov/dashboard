import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/model.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    super.key,
    required this.filterItem,
    this.defaultValue,
    required this.onChange,
  });

  final FilterItem filterItem;
  final String? defaultValue;
  final void Function(String value) onChange;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late String selectedValue = widget.defaultValue ?? widget.filterItem.tiles.first.value;
  String searchValue = '';

  void onSearchChanged(String value) {
    setState(() {
      searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tiles = widget.filterItem.tiles.where((tile) => tile.title.toLowerCase().contains(searchValue.toLowerCase())).toList();

    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(widget.filterItem.title, style: const TextStyle(fontSize: 24)),
            ),
            widget.filterItem.search
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(labelText: 'Поиск'),
                      onChanged: onSearchChanged,
                    ),
                  )
                : const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  final tile = tiles[index];

                  return ListTile(
                    title: Text(tile.title),
                    trailing: tile.value == selectedValue ? const Icon(Icons.check) : null,
                    onTap: () => setState(() => selectedValue = tile.value),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Отменить'),
                  ),
                  const SizedBox(width: 15),
                  TextButton(
                    onPressed: () {
                      context.pop();
                      widget.onChange(selectedValue);
                    },
                    child: const Text('Готово'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
