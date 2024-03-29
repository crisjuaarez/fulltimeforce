import 'package:flutter/material.dart';

import '../../../../ui/widgets/common/my_image_network.dart';
import '../../../home/domain/entities/get_commits_response_entity.dart';

class DetailSliverAppBar extends StatelessWidget {
  const DetailSliverAppBar({super.key, required this.commit});

  final GetCommitsResponse commit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      title: Text(commit.commit.author.name),
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: MyImageNetwork(
          commit.author.avatarUrl,
          heroTag: commit.nodeId,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
