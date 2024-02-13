import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/data/data_sources/commits_data_source.dart';
import 'features/home/data/repositories/commits_repository_impl.dart';
import 'features/home/ui/providers/home_provider.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/shared/ui/providers/theme_provider.dart';
import 'ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
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
}

final _providers = [
  Provider(create: (_) => CommitsDataSource()),
  Provider(
    create: (context) => CommitsRepositoryImpl(
      dataSource: context.read<CommitsDataSource>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => HomeProvider(
      commitsRepository: context.read<CommitsRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
];
