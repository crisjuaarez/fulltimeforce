import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/ui/theme/app_theme.dart';

import 'features/home/ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FullTimeForce',
      theme: AppTheme.themeData(),
      home: const HomeScreen(),
    );
  }
}
