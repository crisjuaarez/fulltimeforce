import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/core/helpers/app_helpers.dart';

import '../../../../detail/ui/screens/detail_screen.dart';
import '../../../domain/entities/get_commits_response_entity.dart';

class CommitWidget extends StatelessWidget {
  const CommitWidget({super.key, required this.commit});
  final CommitsResponseModel commit;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    log(commit.commit.committer.date.toIso8601String());

    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(commit: commit)),
      ),
      leading: ClipOval(
        child: Hero(
          tag: commit.nodeId,
          child: Image.network(commit.author.avatarUrl),
        ),
      ),
      title: Text(
        commit.commit.author.name,
        style: style?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(commit.commit.message, style: style),
      trailing: Text(
        AppHelpers.dateToString(commit.commit.committer.date),
        style: style,
      ),
    );
  }
}
