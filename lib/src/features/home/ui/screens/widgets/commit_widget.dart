import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/app_helpers.dart';
import '../../../../../ui/theme/app_colors.dart';
import '../../../../detail/ui/screens/detail_screen.dart';
import '../../../domain/entities/get_commits_response_entity.dart';
import '../../providers/home_provider.dart';

class CommitWidget extends StatelessWidget {
  const CommitWidget({super.key, required this.commit});
  final GetCommitsResponse commit;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    log(commit.commit.committer.date.toIso8601String());
    final mCommit = commit.commit;
    final size = MediaQuery.of(context).size;

    return Consumer<HomeProvider>(
      builder: (_, notifier, __) {
        if (notifier.isGridList) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(commit: commit),
              ),
            ),
            child: SizedBox(
              width: size.width * 0.5,
              height: size.width * 0.5,
              child: GridTile(
                header: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white24,
                  child: Text(
                    commit.commit.author.name,
                    style: style?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white24,
                  child: Text(
                    '${mCommit.message}\n${AppHelpers.dateWithTimeToString(mCommit.committer.date)}',
                    style: style?.copyWith(color: Colors.black),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: AppColors.primary.withOpacity(0.90)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: commit.nodeId,
                      child: Image.network(commit.author.avatarUrl),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailScreen(commit: commit)),
          ),
          leading: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withOpacity(0.65)),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Hero(
                tag: commit.nodeId,
                child: Image.network(commit.author.avatarUrl),
              ),
            ),
          ),
          title: Text(
            commit.commit.author.name,
            style: style?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${mCommit.message} \n ${AppHelpers.dateWithTimeToString(mCommit.committer.date)}',
            style: style,
          ),
        );
      },
    );
  }
}
