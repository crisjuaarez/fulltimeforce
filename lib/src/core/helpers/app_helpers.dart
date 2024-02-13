import 'package:url_launcher/url_launcher_string.dart';

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
}
