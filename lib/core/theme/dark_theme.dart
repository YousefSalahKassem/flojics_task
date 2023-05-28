
import 'dart:ui';

import 'package:flojics_task/core/theme/app_theme_flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

class DarkTheme extends AppThemeFlavor  {
  DarkTheme() : super.init();

  @override
  // TODO: implement themeData
  ThemeData get themeData => ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(

      )
  );

  @override
  // TODO: implement windowBrightness
  Brightness get windowBrightness => Brightness.dark;

}