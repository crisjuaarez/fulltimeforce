import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui/utils/app_alerts.dart';
import '../../../../ui/widgets/animation/my_loading.dart';
import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/get_commits_response_entity.dart';
import '../providers/home_provider.dart';
import 'widgets/commit_widget.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _getCommits());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: Consumer<HomeProvider>(
          builder: (_, notifier, __) {
            final commits = notifier.commits;
            final failure = notifier.commitsFailure;

            if (notifier.isLoading) return const MyLoading();
            if (failure != null) return Center(child: Text(failure.message));
            if (commits.isEmpty) return const Center(child: Text('No commits'));

            return ListView.separated(
              itemCount: commits.length,
              itemBuilder: (_, i) => CommitWidget(commit: commits[i]),
              separatorBuilder: (_, i) => const Divider(),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    final messenger = ScaffoldMessenger.of(context);
    final result = await _getCommits();
    result.fold(
      (l) => messenger.showSnackBar(
        AppAlerts.getSnackBar(msg: l.message, type: AlertType.error),
      ),
      (r) => messenger.showSnackBar(
        AppAlerts.getSnackBar(msg: 'Commits refreshed'),
      ),
    );
  }

  Future<dartz.Either<Failure, List<CommitsResponseModel>>> _getCommits() {
    return context.read<HomeProvider>().getCommits(
          username: 'crisjuaarez',
          repoName: 'fulltimeforce',
        );
  }
}
