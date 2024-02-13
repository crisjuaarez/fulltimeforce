import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/features/home/ui/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../shared/ui/providers/theme_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return AppBar(
      title: const Text('Commits'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.read<ThemeProvider>().toggleTheme(),
        icon: Consumer<ThemeProvider>(
          builder: (_, notifier, __) => Icon(
            !notifier.isDark ? Icons.dark_mode : Icons.brightness_6,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter',
                          style: textStyle?.copyWith(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: true,
                      groupValue: true,
                      title: const Text('Name'),
                      onChanged: (value) {},
                    ),
                    const Divider(),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: false,
                      groupValue: true,
                      title: const Text('Date'),
                      onChanged: (value) {},
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        child: const Text('Apply'),
                        onPressed: () {
                          context.read<HomeProvider>().filterCommitsByDate();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          icon: const Icon(Icons.tune_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
