import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../ui/theme/app_colors.dart';
import '../../../../search/ui/screens/search_delegate_screen.dart';
import '../../providers/home_provider.dart';

class SearchFab extends StatelessWidget {
  const SearchFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        final commits = context.read<HomeProvider>().commits;
        final List<String> commitsMessages = [];
        for (var commit in commits) {
          commitsMessages.add(commit.commit.message);
        }
        showSearch(
          context: context,
          delegate: MySearchDelegateScreen(),
        );
      },
      child: const Icon(Icons.search, color: Colors.white),
    );
  }
}
