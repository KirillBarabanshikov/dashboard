import 'package:flutter/material.dart';

class MyPagination extends StatefulWidget {
  const MyPagination({
    super.key,
    required this.pageNumber,
    required this.onChange,
    this.currentPage,
    this.maxPageButtons = 3,
  });

  final int pageNumber;
  final int? currentPage;
  final Function onChange;
  final int maxPageButtons;

  @override
  State<MyPagination> createState() => _MyPaginationState();
}

class _MyPaginationState extends State<MyPagination> {
  int _currentPage = 1;

  @override
  void initState() {
    _currentPage = widget.currentPage ?? 1;
    super.initState();
  }

  void _handleChangePage(int page) {
    widget.onChange(page);

    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget pageButton(int pageNumber) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: TextButton(
          onPressed: () => _currentPage == pageNumber ? {} : _handleChangePage(pageNumber),
          style: TextButton.styleFrom(
              fixedSize: const Size(40, 40), backgroundColor: _currentPage == pageNumber ? theme.colorScheme.inversePrimary : null),
          child: Text(
            pageNumber.toString(),
          ),
        ),
      );
    }

    Widget ellipsis() {
      return const Padding(
        padding: EdgeInsets.only(right: 5),
        child: Text('...'),
      );
    }

    List<Widget> buildPageList() {
      List<Widget> list = [];

      int startPage;
      int endPage;
      int maxPageButtons = widget.maxPageButtons;

      if (maxPageButtons >= widget.pageNumber) {
        startPage = 2;
        endPage = widget.pageNumber - 1;
      } else {
        startPage = _currentPage - 1;
        endPage = _currentPage + 1;

        if (startPage < 2) startPage = 2;

        if (endPage > widget.pageNumber - 1) endPage = widget.pageNumber - 1;

        if (_currentPage == 2) {
          endPage = startPage + maxPageButtons - 2;
        } else if (_currentPage == widget.pageNumber - 1) {
          startPage = endPage - maxPageButtons + 2;
        }
      }

      list.add(pageButton(1));

      if (startPage > 2) {
        list.add(ellipsis());
      }

      for (int i = startPage; i <= endPage; i++) {
        list.add(pageButton(i));
      }

      if (endPage < widget.pageNumber - 1) {
        list.add(ellipsis());
      }

      if (widget.pageNumber > 1) {
        list.add(pageButton(widget.pageNumber));
      }

      return list;
    }

    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: _currentPage > 1 ? () => _handleChangePage(_currentPage - 1) : null,
        ),
      ),
      ...buildPageList(),
      IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: _currentPage < widget.pageNumber ? () => _handleChangePage(_currentPage + 1) : null,
      ),
    ]);
  }
}
