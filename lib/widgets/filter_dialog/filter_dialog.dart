import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    super.key,
    required this.filterItem,
    this.defaultValue,
    this.search = false,
    required this.onDone,
  });

  final FilterItem filterItem;
  final String? defaultValue;
  final bool search;
  final Function(String value) onDone;

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
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(widget.filterItem.title, style: const TextStyle(fontSize: 24)),
            ),
            widget.search
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
                      widget.onDone(selectedValue);
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

class FilterItem {
  const FilterItem({
    required this.name,
    required this.title,
    required this.tiles,
  });

  final String name;
  final String title;
  final List<FilterTile> tiles;
}

class FilterTile {
  const FilterTile({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;
}
