import 'package:flutter/material.dart';
import 'package:ic_jwt/services/di.dart';

import 'app.dart';
import 'services/shared_preference_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  configureDependencies();
  runApp(const App());
}

