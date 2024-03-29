import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/local_storage/app_preferences.dart';
import '../../ui/widgets/common/my_button.dart';
import '../home/ui/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: kToolbarHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.welcome,
              fit: BoxFit.cover,
              key: const Key('welcome_image'),
            ),
            Text(
              'Welcome to FullTimeForce',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
              key: const Key('welcome_text'),
            ),
            const Spacer(),
            MyButton(
              text: 'Get Started',
              key: const Key('get_started_button'),
              onPressed: () {
                AppPreferences.setFirstTime(false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
