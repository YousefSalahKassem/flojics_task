import 'package:flojics_task/core/theme/app_theme_flavor.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LightTheme extends AppThemeFlavor  {
  LightTheme() : super.init();

  @override
  // TODO: implement themeData
  ThemeData get themeData => ThemeData.from(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF0F1327),
        secondary: Color(0xFFEFC3FE),
        onPrimary: Colors.white,
        surface: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
        background: Colors.white,
        error: Colors.red,
        onBackground: Colors.black87,
        onError: Colors.white,
      ),

  ).copyWith(
    backgroundColor: AppColors.halfWhite,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w900),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.background,
    cardTheme: const CardTheme(color: AppColors.background),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    dividerColor: AppColors.lightGrey,
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.background),
  );

  @override
  // TODO: implement windowBrightness
  Brightness get windowBrightness => Brightness.light;
}