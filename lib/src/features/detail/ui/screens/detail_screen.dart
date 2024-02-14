import 'package:flutter/material.dart';

import '../../../../core/helpers/app_helpers.dart';
import '../../../home/domain/entities/get_commits_response_entity.dart';
import '../widgets/detail_sliver_app_bar.dart';
import '../widgets/launch_tile.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.commit});
  final GetCommitsResponse commit;

  @override
  Widget build(BuildContext context) {
    final mCommit = commit.commit;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [DetailSliverAppBar(commit: commit)],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DetailItem(
                      title: 'Author',
                      subtitle: mCommit.author.name,
                    ),
                  ),
                  Expanded(
                    child: DetailItem(
                      title: 'Email',
                      subtitle: mCommit.author.email,
                    ),
                  ),
                ],
              ),
              DetailItem(title: 'Message', subtitle: mCommit.message),
              Row(
                children: [
                  Expanded(
                    child: DetailItem(
                      title: 'Date',
                      subtitle: AppHelpers.dateToString(mCommit.author.date),
                    ),
                  ),
                  Expanded(
                    child: DetailItem(
                      title: 'Time',
                      subtitle: AppHelpers.dateToTimeString(
                        mCommit.author.date,
                      ),
                    ),
                  ),
                ],
              ),
              DetailItem(
                title: 'Sha',
                subtitle: commit.sha,
                textToCopy: commit.sha,
              ),
              DetailItem(
                title: 'Commit url',
                subtitle: 'Go to Github',
                url: commit.htmlUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
