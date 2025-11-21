import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:task_planner/global.dart';
import 'package:task_planner/shared/data/local/shared_pref.dart';
import 'package:task_planner/shared/providers/shared_pref_providers.dart';
//import 'package:flutter_riverpod/legacy.dart';
import 'package:task_planner/theme/colors.dart';

final appthemeProvider = StateNotifierProvider<AppThemeNotifier, ThemeMode>((
  ref,
) {
  final storage = ref.watch(sharesprefProvider);
  return AppThemeNotifier(storage);
});

class AppThemeNotifier extends StateNotifier<ThemeMode> {
  AppThemeNotifier(this.storage) : super(ThemeMode.dark) {
    getCurrent();
  }

  SharedPref storage;

  toggleTheme() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    storage.setString(appTheme, state.name);
  }

  getCurrent() async {
    final theme = await storage.getString(appTheme);
    state = ThemeMode.values.byName(theme ?? 'light');
  }
}

class AppTheme {
  static ThemeData get theme => ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xff2b4e62),
      secondary: Color(0xff437c93),
      tertiary: Color(0xff5ca8c6),
    ),
  );

  static ThemeData get dark => ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xff2b4e62),
      secondary: Color(0xff437c93),
      tertiary: Color.fromARGB(255, 41, 95, 117),
    ),
    scaffoldBackgroundColor: AppColors.black,
  );
}
