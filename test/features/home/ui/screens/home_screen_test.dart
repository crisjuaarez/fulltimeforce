import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_app/src/features/detail/ui/screens/detail_screen.dart';
import 'package:fulltimeforce_app/src/features/home/data/data_sources/commits_data_source.dart';
import 'package:fulltimeforce_app/src/features/home/data/models/get_commits_response_model.dart';
import 'package:fulltimeforce_app/src/features/home/data/repositories/commits_repository_impl.dart';
import 'package:fulltimeforce_app/src/features/home/domain/entities/get_commits_response_entity.dart';
import 'package:fulltimeforce_app/src/features/home/domain/repositories/commits_repository.dart';
import 'package:fulltimeforce_app/src/features/home/ui/providers/home_provider.dart';
import 'package:fulltimeforce_app/src/features/home/ui/screens/home_screen.dart';
import 'package:fulltimeforce_app/src/features/shared/ui/providers/theme_provider.dart';
import 'package:fulltimeforce_app/src/ui/theme/app_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockCommitsRepository extends Mock implements CommitsRepository {}

void main() {
  late MockCommitsRepository commitsRepository;
  setUp(() {
    commitsRepository = MockCommitsRepository();
  });

  Widget buildWidget() {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CommitsDataSource()),
        Provider(
          create: (context) => CommitsRepositoryImpl(
            dataSource: context.read<CommitsDataSource>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            commitsRepository: commitsRepository,
          ),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, theme, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FullTimeForce',
          theme: AppTheme.themeData(isDark: theme.isDark),
          home: const HomeScreen(),
        ),
      ),
    );
  }

  void arrangeCommits({Duration? duration}) {
    when(
      () => commitsRepository.getCommits(
        username: 'crisjuaarez',
        repoName: 'fulltimeforce',
      ),
    ).thenAnswer(
      (_) async {
        if (duration != null) await Future.delayed(duration);
        return Right([fakeCommitResponse()]);
      },
    );
  }

  testWidgets('show loading', (tester) async {
    // arrange
    arrangeCommits(duration: const Duration(seconds: 2));
    await tester.pumpWidget(buildWidget());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byKey(const Key('commits_loading')), findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('change list to grid', (tester) async {
    arrangeCommits();
    await tester.pumpWidget(buildWidget());
    final gridListButton = find.byKey(const Key('grid_list_button'));
    expect(gridListButton, findsOneWidget);
    await tester.tap(gridListButton);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('grid_list_commits')), findsOneWidget);
    expect(find.byKey(const Key('list_commits')), findsNothing);
  });

  testWidgets('change list to grid and back', (tester) async {
    arrangeCommits();
    await tester.pumpWidget(buildWidget());
    final gridListButton = find.byKey(const Key('grid_list_button'));
    expect(gridListButton, findsOneWidget);
    await tester.tap(gridListButton);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('grid_list_commits')), findsOneWidget);
    expect(find.byKey(const Key('list_commits')), findsNothing);
    await tester.tap(gridListButton);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('grid_list_commits')), findsNothing);
    expect(find.byKey(const Key('list_commits')), findsOneWidget);
  });

  testWidgets('navigate to detail screen', (tester) async {
    arrangeCommits();
    await tester.pumpWidget(buildWidget());
    await tester.pump(const Duration(milliseconds: 500));
    final commmitWidget = find.byKey(const Key('commit_widget'));
    expect(commmitWidget, findsOneWidget);
    await tester.tap(commmitWidget);
    await tester.pumpAndSettle();
    expect(find.byType(DetailScreen), findsOneWidget);
  });
}

GetCommitsResponse fakeCommitResponse() {
  Map<String, dynamic> commitData = {
    'sha': '5283cedd84f83df98671db3ad45bd9d0335224a8',
    'node_id':
        'C_kwDOLRk0E9oAKDUyODNjZWRkODRmODNkZjk4NjcxZGIzYWQ0NWJkOWQwMzM1MjI0YTg',
    'commit': {
      'author': {
        'name': 'Cristofer Juarez',
        'email': 'criller.apps@gmail.com',
        'date': '2024-02-14T04:35:04Z',
      },
      'committer': {
        'name': 'Cristofer Juarez',
        'email': 'criller.apps@gmail.com',
        'date': '2024-02-14T04:35:04Z',
      },
      'message': 'feature: search fab and search screen',
      'tree': {
        'sha': '384b0f7f4271cd6d6d59930bb72dae070ae5b2b0',
        'url':
            'https://api.github.com/repos/crisjuaarez/fulltimeforce/git/trees/384b0f7f4271cd6d6d59930bb72dae070ae5b2b0',
      },
      'url':
          'https://api.github.com/repos/crisjuaarez/fulltimeforce/git/commits/5283cedd84f83df98671db3ad45bd9d0335224a8',
      'comment_count': 0,
      'verification': {
        'verified': false,
        'reason': 'unsigned',
        'signature': null,
        'payload': null,
      },
    },
    'url':
        'https://api.github.com/repos/crisjuaarez/fulltimeforce/commits/5283cedd84f83df98671db3ad45bd9d0335224a8',
    'html_url':
        'https://github.com/crisjuaarez/fulltimeforce/commit/5283cedd84f83df98671db3ad45bd9d0335224a8',
    'comments_url':
        'https://api.github.com/repos/crisjuaarez/fulltimeforce/commits/5283cedd84f83df98671db3ad45bd9d0335224a8/comments',
    'author': {
      'login': 'crisjuaarez',
      'id': 55218990,
      'node_id': 'MDQ6VXNlcjU1MjE4OTkw',
      'avatar_url': 'https://avatars.githubusercontent.com/u/55218990?v=4',
      'gravatar_id': '',
      'url': 'https://api.github.com/users/crisjuaarez',
      'html_url': 'https://github.com/crisjuaarez',
      'followers_url': 'https://api.github.com/users/crisjuaarez/followers',
      'following_url':
          'https://api.github.com/users/crisjuaarez/following{/other_user}',
      'gists_url': 'https://api.github.com/users/crisjuaarez/gists{/gist_id}',
      'starred_url':
          'https://api.github.com/users/crisjuaarez/starred{/owner}{/repo}',
      'subscriptions_url':
          'https://api.github.com/users/crisjuaarez/subscriptions',
      'organizations_url': 'https://api.github.com/users/crisjuaarez/orgs',
      'repos_url': 'https://api.github.com/users/crisjuaarez/repos',
      'events_url': 'https://api.github.com/users/crisjuaarez/events{/privacy}',
      'received_events_url':
          'https://api.github.com/users/crisjuaarez/received_events',
      'type': 'User',
      'site_admin': false,
    },
    'committer': {
      'login': 'crisjuaarez',
      'id': 55218990,
      'node_id': 'MDQ6VXNlcjU1MjE4OTkw',
      'avatar_url': 'https://avatars.githubusercontent.com/u/55218990?v=4',
      'gravatar_id': '',
      'url': 'https://api.github.com/users/crisjuaarez',
      'html_url': 'https://github.com/crisjuaarez',
      'followers_url': 'https://api.github.com/users/crisjuaarez/followers',
      'following_url':
          'https://api.github.com/users/crisjuaarez/following{/other_user}',
      'gists_url': 'https://api.github.com/users/crisjuaarez/gists{/gist_id}',
      'starred_url':
          'https://api.github.com/users/crisjuaarez/starred{/owner}{/repo}',
      'subscriptions_url':
          'https://api.github.com/users/crisjuaarez/subscriptions',
      'organizations_url': 'https://api.github.com/users/crisjuaarez/orgs',
      'repos_url': 'https://api.github.com/users/crisjuaarez/repos',
      'events_url': 'https://api.github.com/users/crisjuaarez/events{/privacy}',
      'received_events_url':
          'https://api.github.com/users/crisjuaarez/received_events',
      'type': 'User',
      'site_admin': false,
    },
    'parents': [
      {
        'sha': '9433ec7bdcd2e037ec10c764a6f23586fad5f866',
        'url':
            'https://api.github.com/repos/crisjuaarez/fulltimeforce/commits/9433ec7bdcd2e037ec10c764a6f23586fad5f866',
        'html_url':
            'https://github.com/crisjuaarez/fulltimeforce/commit/9433ec7bdcd2e037ec10c764a6f23586fad5f866',
      },
    ],
  };

  return GetCommitsResponseModel.fromJson(commitData);
}
