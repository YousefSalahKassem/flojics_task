import 'package:flojics_task/core/blocs/notifiers/app_theme_notifier.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AppTheme extends StatelessWidget {
  final Widget Function(ThemeData theme) builder;

  const AppTheme({super.key, required this.builder});

  static AppThemeData? maybeOf(BuildContext context) {
    return context.theme.extension<AppThemeData>();
  }

  static AppThemeData of(BuildContext context) {
    return maybeOf(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_,ref,__){
      final theme =
      ref.watch(AppThemeNotifier.provider.select((value) => value.theme));
      return builder(theme);
    },
    );
  }
}
