import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/features/home/ui/screens/widgets/grid_list_commits.dart';
import 'package:fulltimeforce_app/src/features/home/ui/screens/widgets/search_fab.dart';
import 'package:fulltimeforce_app/src/ui/widgets/common/my_button.dart';
import 'package:provider/provider.dart';

import '../../../../ui/utils/app_alerts.dart';
import '../../../../ui/widgets/animation/my_loading.dart';
import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/get_commits_response_entity.dart';
import '../providers/home_provider.dart';
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
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: const SearchFab(),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: Consumer<HomeProvider>(
          key: const Key('commits_consumer'),
          builder: (_, notifier, __) {
            final commits = notifier.commits;
            final failure = notifier.commitsFailure;

            if (notifier.isLoading) {
              return const MyLoading(key: Key('commits_loading'));
            }
            if (failure != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        failure.message,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 12),
                    MyButton(
                      onPressed: _getCommits,
                      text: 'Refresh',
                      key: const Key('refresh_button'),
                    ),
                  ],
                ),
              );
            }
            if (commits.isEmpty) return const Center(child: Text('No commits'));

            return SizedBox(
              width: size.width,
              height: size.height,
              child: GridListCommits(commits: commits),
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

  Future<dartz.Either<Failure, List<GetCommitsResponse>>> _getCommits() {
    return context.read<HomeProvider>().getCommits(
          username: 'crisjuaarez',
          repoName: 'fulltimeforce',
        );
  }
}
