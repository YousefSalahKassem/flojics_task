import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/blocs/notifiers/app_theme_notifier.dart';
import 'package:flojics_task/core/blocs/notifiers/app_token_notifier.dart';
import 'package:flojics_task/core/helper/ui/enums.dart';
import 'package:flojics_task/features/authentication/blocs/notifiers/profile_notifier.dart';
import 'package:flojics_task/features/authentication/models/response/profile_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// *** Extensions on BuildContext class *** ----------------
extension BuildContextUtils on BuildContext {
  //* MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //* Dimensions Extensions
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  Size get screenSize => MediaQuery.of(this).size;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  double get longestSide => MediaQuery.of(this).size.longestSide;

  Orientation get orientation => MediaQuery.of(this).orientation;

  double heightR(double value) => MediaQuery.of(this).size.height * value;

  double widthR(double value) => MediaQuery.of(this).size.width * value;

  bool get isArabic => locale.languageCode == "ar";

  //* Device Breakpoints
  bool get isMobile => width <= 600;

  bool get isTablet => width > 600;

  bool get isDesktop => width > 950;

  bool get isLargeMobile => isMobile && height > 750;

  bool get isSmallMobile => isMobile && height < 550;

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension WidgetRefX on WidgetRef {
  void toggleThemeMode() {
    watch(AppThemeNotifier.provider).isDarkTheme
        ? read(AppThemeNotifier.provider.notifier)
            .setThemeFlavor(ThemeFlavor.light)
        : read(AppThemeNotifier.provider.notifier)
            .setThemeFlavor(ThemeFlavor.dark);
  }

  Future<bool> isLoggedIn() async {
    await read(AppTokenNotifier.provider.notifier).init();
    final authProvider = watch(AppTokenNotifier.provider.notifier);
    return authProvider.token != null;
  }

  ProfileResponse currentUser() {

    return watch(ProfileNotifier.provider).getData() ?? ProfileResponse.empty();
  }
}
