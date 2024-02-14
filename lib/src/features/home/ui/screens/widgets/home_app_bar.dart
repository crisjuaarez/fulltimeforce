import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/features/home/ui/screens/widgets/grid_list_button.dart';

import 'filter_button.dart';
import 'theme_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Commits'),
      leading: const ThemeButton(),
      actions: const [
        GridListButton(),
        FilterButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
