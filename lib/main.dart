import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petmealsweb/firebase_options.dart';
import 'package:petmealsweb/routers/routes.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xFF7fa3cc)),
        colorSchemeSeed: const Color(0xFF7fa3cc),
      ),
    );
  }
}
