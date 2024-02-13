import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/ui/providers/theme_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Commits'),
      actions: [
        IconButton(
          onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          icon: Consumer<ThemeProvider>(
            builder: (_, notifier, __) => Icon(
              notifier.isDark ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
