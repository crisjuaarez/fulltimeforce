import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class GridListButton extends StatelessWidget {
  const GridListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeProvider>().toggleGridList(),
      icon: Consumer<HomeProvider>(
        builder: (_, notifier, __) => Icon(
          notifier.isGridList ? Icons.grid_view_outlined : Icons.list_outlined,
        ),
      ),
    );
  }
}
