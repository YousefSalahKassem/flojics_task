import 'package:flojics_task/core/constants/constants.dart';
import 'package:flojics_task/core/helper/ui/enums.dart';
import 'package:flojics_task/core/theme/app_theme_flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppThemeNotifier>(
    (ref) {
      return AppThemeNotifier();
    },
  );

  ThemeFlavor _themeFlavor = ThemeFlavor.system;
  late AppThemeFlavor _appThemeFlavour = AppThemeFlavor(_themeFlavor);

  ThemeFlavor get themeFlavor => _themeFlavor;

  Brightness get windowBrightness => _appThemeFlavour.windowBrightness;

  ThemeData get theme => _appThemeFlavour.theme;

  bool get isDarkTheme => _themeFlavor == ThemeFlavor.dark;



  AppThemeNotifier(){
    init();
  }

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final savedFlavorValue = sharedPreferences.getString(AppConstants.selectedTheme);
    setThemeFlavor(ThemeFlavor.fromString(savedFlavorValue));
    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      if (_themeFlavor == ThemeFlavor.system) {
        _updateTheme();
      }
    };
  }

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _themeFlavor = flavor;
    await sharedPreferences.setString(AppConstants.selectedTheme, flavor.name);
    _updateTheme();
  }

  void _updateTheme() {
    _appThemeFlavour = AppThemeFlavor(_themeFlavor);
    notifyListeners();
  }
}
