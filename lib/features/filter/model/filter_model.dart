enum Filters {
  date,
  lfl,
  city,
  store,
  level,
  subordinate,
  plan,
  indicator,
  block,
}

class FilterItem {
  const FilterItem({
    required this.name,
    required this.title,
    required this.tiles,
    this.search = false,
  });

  final String name;
  final String title;
  final List<FilterTile> tiles;
  final bool search;
}

class FilterTile {
  const FilterTile({
    required this.title,
    required this.value,
  });

  final String title;
  final dynamic value;
}
