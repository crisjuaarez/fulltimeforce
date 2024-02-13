import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

enum AlertType { success, error }

abstract class AppAlerts {
  static MaterialBanner getTopBanner({
    required String msg,
    AlertType type = AlertType.error,
    required ScaffoldMessengerState messenger,
    bool showEmoji = true,
  }) {
    messenger.clearMaterialBanners();
    String getMsg() {
      if (!showEmoji) return msg;
      if (type == AlertType.success) return '$msg 😊';
      return '$msg 😢';
    }

    Color getBannerColor() =>
        (type == AlertType.success) ? AppColors.primary : Colors.red;

    return MaterialBanner(
      padding: const EdgeInsets.all(20),
      content: Text(
        getMsg(),
        style: GoogleFonts.cabin(color: Colors.white),
      ),
      elevation: 1,
      backgroundColor: getBannerColor(),
      onVisible: () async {
        await Future.delayed(const Duration(seconds: 3));
        messenger.hideCurrentMaterialBanner();
      },
      actions: [
        IconButton(
          onPressed: () => messenger.hideCurrentMaterialBanner(),
          icon: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  static SnackBar getSnackBar({
    required String msg,
    AlertType type = AlertType.success,
    bool showEmoji = true,
  }) {
    Color getColor() =>
        (type == AlertType.success) ? AppColors.primary : Colors.red;
    String getMsg() {
      if (!showEmoji) return msg;
      if (type == AlertType.success) return '$msg ✅';
      return '$msg ❌';
    }

    return SnackBar(
      content: Text(
        getMsg(),
        textAlign: TextAlign.center,
        style: GoogleFonts.cabin(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: getColor(),
    );
  }
}
