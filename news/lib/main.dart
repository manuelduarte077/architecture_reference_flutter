import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:news_app_clean_architecture/app/app.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  /// Flutter DotEnv
  await dotenv.load();

  /// Flutter Run App
  runApp(const MyApp());
}
