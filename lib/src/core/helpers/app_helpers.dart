import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:url_launcher/url_launcher_string.dart' show launchUrlString;

abstract class AppHelpers {
  static Future<bool> launchUrl(String url) async {
    return await launchUrlString(url);
  }

  static String dateToString(DateTime dateTime) {
    final String day =
        dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    final String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    final String year = '${dateTime.year}';

    return '$day/$month/$year';
  }

  static String dateToTimeString(DateTime dateTime) {
    final hour = dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
    final minute =
        dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
    final seconds =
        dateTime.second < 10 ? '0${dateTime.second}' : '${dateTime.second}';
    final date = '$hour:$minute:$seconds';
    return date;
  }

  static String dateWithTimeToString(DateTime dateTime) {
    final day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    final month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    final year = '${dateTime.year}';
    final hour = dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
    final minute =
        dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
    final seconds =
        dateTime.second < 10 ? '0${dateTime.second}' : '${dateTime.second}';
    final date = '$day-$month-$year at $hour:$minute:$seconds';
    return date;
  }

  //copy from clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
