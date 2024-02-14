import 'package:flutter/material.dart';

import 'src/core/local_storage/app_preferences.dart';
import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initialize();
  runApp(const MyApp());
}
