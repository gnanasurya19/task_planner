import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/features/splash/providers/user_cache_provider.dart';
import 'package:task_planner/theme/colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      debugger();
      final isUserLoggedIn = await ref.read(usercacheProvider.future);
      final route = isUserLoggedIn ? "home" : "login";
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Text('Splash Screen')),
    );
  }
}
