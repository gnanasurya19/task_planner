import 'package:flutter/material.dart';
import 'package:task_planner/features/auth/presentation/screens/home_screen.dart';
import 'package:task_planner/features/auth/presentation/screens/login_screen.dart';
import 'package:task_planner/features/splash/presentation/splash_screen.dart';

class AppRoutes {
  static String initialRoute = "splash";

  static Map<String, WidgetBuilder> get routes {
    return {
      "splash": (context) => SplashScreen(),
      "login": (context) => const LoginPage(),
      'home': (context) => HomePage(),
    };
  }
}
