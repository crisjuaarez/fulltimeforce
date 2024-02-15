import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const baseUrl = 'https://api.github.com';
  static final token = dotenv.get('GITHUB_TOKEN', fallback: '');
}
