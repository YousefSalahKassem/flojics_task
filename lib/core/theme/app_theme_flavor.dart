import 'package:flojics_task/core/helper/ui/enums.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/theme/dark_theme.dart';
import 'package:flojics_task/core/theme/light_theme.dart';
import 'package:flutter/material.dart';

abstract class AppThemeFlavor {
  factory AppThemeFlavor(ThemeFlavor themeFlavor) {
    switch (themeFlavor) {
      case ThemeFlavor.light:
        return LightTheme();
      case ThemeFlavor.dark:
        return DarkTheme();
      default:
        return UiHelpers.windowBrightness ==
            Brightness.dark
            ? DarkTheme()
            : LightTheme();
    }
  }

  Brightness get windowBrightness;

  @protected
  ThemeData get themeData;

  ThemeData get theme => _generalThemeData.copyWith(
    applyElevationOverlayColor: themeData.applyElevationOverlayColor,
    cupertinoOverrideTheme: themeData.cupertinoOverrideTheme,
    inputDecorationTheme: themeData.inputDecorationTheme,
    materialTapTargetSize: themeData.materialTapTargetSize,
    pageTransitionsTheme: themeData.pageTransitionsTheme,
    platform: themeData.platform,
    scrollbarTheme: themeData.scrollbarTheme,
    splashFactory: themeData.splashFactory,
    useMaterial3: themeData.useMaterial3,
    visualDensity: themeData.visualDensity,
    backgroundColor: themeData.backgroundColor,
    bottomAppBarColor: themeData.bottomAppBarColor,
    brightness: themeData.brightness,
    canvasColor: themeData.canvasColor,
    cardColor: themeData.cardColor,
    colorScheme: themeData.colorScheme,
    dialogBackgroundColor: themeData.dialogBackgroundColor,
    disabledColor: themeData.disabledColor,
    dividerColor: themeData.dividerColor,
    errorColor: themeData.errorColor,
    focusColor: themeData.focusColor,
    highlightColor: themeData.highlightColor,
    hintColor: themeData.hintColor,
    hoverColor: themeData.hoverColor,
    indicatorColor: themeData.indicatorColor,
    primaryColor: themeData.primaryColor,
    primaryColorDark: themeData.primaryColorDark,
    primaryColorLight: themeData.primaryColorLight,
    scaffoldBackgroundColor: themeData.scaffoldBackgroundColor,
    secondaryHeaderColor: themeData.secondaryHeaderColor,
    selectedRowColor: themeData.selectedRowColor,
    shadowColor: themeData.shadowColor,
    splashColor: themeData.splashColor,
    toggleableActiveColor: themeData.toggleableActiveColor,
    unselectedWidgetColor: themeData.unselectedWidgetColor,
    iconTheme: themeData.iconTheme,
    primaryIconTheme: themeData.primaryIconTheme,
    primaryTextTheme: themeData.primaryTextTheme,
    textTheme: themeData.textTheme,
    typography: themeData.typography,
    appBarTheme: themeData.appBarTheme,
    bannerTheme: themeData.bannerTheme,
    bottomAppBarTheme: themeData.bottomAppBarTheme,
    bottomNavigationBarTheme: themeData.bottomNavigationBarTheme,
    bottomSheetTheme: themeData.bottomSheetTheme,
    buttonBarTheme: themeData.buttonBarTheme,
    buttonTheme: themeData.buttonTheme,
    cardTheme: themeData.cardTheme,
    checkboxTheme: themeData.checkboxTheme,
    chipTheme: themeData.chipTheme,
    dataTableTheme: themeData.dataTableTheme,
    dialogTheme: themeData.dialogTheme,
    dividerTheme: themeData.dividerTheme,
    drawerTheme: themeData.drawerTheme,
    elevatedButtonTheme: themeData.elevatedButtonTheme,
    expansionTileTheme: themeData.expansionTileTheme,
    floatingActionButtonTheme: themeData.floatingActionButtonTheme,
    listTileTheme: themeData.listTileTheme,
    navigationBarTheme: themeData.navigationBarTheme,
    navigationRailTheme: themeData.navigationRailTheme,
    outlinedButtonTheme: themeData.outlinedButtonTheme,
    popupMenuTheme: themeData.popupMenuTheme,
    progressIndicatorTheme: themeData.progressIndicatorTheme,
    radioTheme: themeData.radioTheme,
    sliderTheme: themeData.sliderTheme,
    snackBarTheme: themeData.snackBarTheme,
    switchTheme: themeData.switchTheme,
    tabBarTheme: themeData.tabBarTheme,
    textButtonTheme: themeData.textButtonTheme,
    textSelectionTheme: themeData.textSelectionTheme,
    timePickerTheme: themeData.timePickerTheme,
    toggleButtonsTheme: themeData.toggleButtonsTheme,
    tooltipTheme: themeData.tooltipTheme,
    accentColor: themeData.accentColor,
    accentColorBrightness: themeData.accentColorBrightness,
    accentTextTheme: themeData.accentTextTheme,
    accentIconTheme: themeData.accentIconTheme,
    buttonColor: themeData.buttonColor,
    fixTextFieldOutlineLabel: themeData.fixTextFieldOutlineLabel,
    primaryColorBrightness: themeData.primaryColorBrightness,
    androidOverscrollIndicator: themeData.androidOverscrollIndicator,
    extensions: [...themeData.extensions.values],
  );

  final ThemeData _generalThemeData = ThemeData(
    // Main Theme Font
    fontFamily: 'Tajawal',
  );

  @protected
  AppThemeFlavor.init();
}
