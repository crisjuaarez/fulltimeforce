import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/core/local_storage/app_preferences.dart';
import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await AppPreferences.initialize();
  runApp(const MyApp());
}
