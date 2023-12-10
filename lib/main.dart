import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'shared/repositories/shared_preferences_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesRepository.init();

  runApp(
    const MaterialApp(
      home: LoginPage(),
    ),
  );
}
