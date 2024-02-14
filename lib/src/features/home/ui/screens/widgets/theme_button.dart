import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/ui/providers/theme_provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeProvider>().toggleTheme(),
      icon: Consumer<ThemeProvider>(
        builder: (_, notifier, __) => Icon(
          !notifier.isDark ? Icons.dark_mode : Icons.brightness_6,
        ),
      ),
    );
  }
}
