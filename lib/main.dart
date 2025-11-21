import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/firebase_options.dart';
import 'package:task_planner/routes/route.dart';
import 'package:task_planner/theme/app_theme.dart';
import 'package:task_planner/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  static AppStyle get style => _appStyle;
  static AppStyle _appStyle = AppStyle();

  @override
  Widget build(BuildContext context, ref) {
    _appStyle = AppStyle(screenSize: MediaQuery.sizeOf(context));
    final theme = ref.watch(appthemeProvider);
    return MaterialApp(
      theme: AppTheme.theme,
      darkTheme: AppTheme.dark,
      themeMode: theme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
