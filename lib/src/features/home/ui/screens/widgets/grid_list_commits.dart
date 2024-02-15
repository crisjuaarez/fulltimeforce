import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/get_commits_response_entity.dart';
import '../../providers/home_provider.dart';
import 'commit_widget.dart';

class GridListCommits extends StatelessWidget {
  const GridListCommits({super.key, required this.commits});

  final List<GetCommitsResponse> commits;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, notifier, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => SlideTransition(
            position: animation.drive(
              Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)),
            ),
            child: child,
          ),
          child: notifier.isGridList
              ? GridView.builder(
                  key: const Key('grid_list_commits'),
                  itemCount: commits.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  // shrinkWrap: true,
                  itemBuilder: (_, i) => CommitWidget(commit: commits[i]),
                )
              : ListView.separated(
                  key: const Key('list_commits'),
                  itemCount: commits.length,
                  // shrinkWrap: true,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (_, i) => CommitWidget(commit: commits[i]),
                  separatorBuilder: (_, i) =>
                      const Divider(color: Colors.black12),
                ),
        );
      },
    );
  }
}
