import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/core/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset(AppAssets.loadingLottieJson));
  }
}
