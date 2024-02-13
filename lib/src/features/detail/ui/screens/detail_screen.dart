import 'package:flutter/material.dart';

import '../../../home/domain/entities/get_commits_response_entity.dart';
import '../widgets/detail_sliver_app_bar.dart';
import '../widgets/launch_tile.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.commit});
  final CommitsResponseModel commit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          DetailSliverAppBar(commit: commit),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LaunchTile(
                title: 'Go to repositories',
                subtitle: 'S',
              ),
              LaunchTile(
                title: 'Go to commits',
                url: commit.author.url,
              ),
              LaunchTile(
                title: 'Go to issues',
                url: commit.author.gistsUrl,
              ),
              LaunchTile(
                title: 'Go to events',
                url: commit.author.eventsUrl,
              ),
              LaunchTile(
                title: 'Go to followers',
                url: commit.author.followersUrl,
              ),
              LaunchTile(
                title: 'Go to following',
                url: commit.author.followingUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
