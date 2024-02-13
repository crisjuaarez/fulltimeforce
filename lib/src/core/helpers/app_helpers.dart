import 'package:url_launcher/url_launcher_string.dart';

abstract class AppHelpers {
  static Future<bool> launchUrl(String url) async {
    return await launchUrlString(url);
  }
}
