import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool _isDescending = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => _isDescending = !_isDescending);
        context.read<HomeProvider>().filterCommitsByDate(
              ascending: !_isDescending,
            );
      },
      icon: Icon(!_isDescending ? Icons.arrow_upward : Icons.arrow_downward),
    );
  }
}
