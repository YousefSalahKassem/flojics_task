import 'package:flutter/material.dart';

typedef AppThemeExtension = ThemeExtension<AppThemeData>;

class AppThemeData extends AppThemeExtension {
  final Color foreground;
  final Color background;

  const AppThemeData({
    required this.background,
    required this.foreground,
  });

  List<Object?> get props =>
      [
        background,
        foreground,
      ];

  @override
  ThemeExtension<AppThemeData> copyWith() {
    return this;
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeData) return this;

    final normT = t.clamp(0, 1).toDouble();
    
    Color lerpColor(Color color1, Color color2) {
      return Color.lerp(color1, color2, normT)!;
    }

    return AppThemeData(
      background: lerpColor(background, other.background),
      foreground: lerpColor(foreground, other.foreground),
    );
  }
}
