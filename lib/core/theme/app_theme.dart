import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainAppColor),
        scaffoldBackgroundColor: AppColors.mainAppColor,
        useMaterial3: false,
        fontFamily: 'AlbertSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        dividerColor: AppColors.dividerAppColor,
        brightness: Brightness.light,
      ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ));
}
