//* ######################## App TextStyles #########################

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin TextStyles {
  static const fontFamily = 'Tajawal';
  static const fontLineHeightMultiplier = 1.8;

  static final displayLarge = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.bold,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 2.6,
  );

  /// 18 med
  static final displayMedium = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 2.1,
  );

  /// 17 reg
  static final displaySmall = TextStyle(
    fontSize: 17.spMin,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height:1.5.h,
  );

  /// 16 med
  static final headlineLarge = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w700,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height:1.5.h,
  );

  /// 16 med
  static final headlineMedium = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.5.h,
  );

  /// 16 reg
  static final headlineSmall = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.18.h,
  );

  /// 14 med
  static final titleLarge = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.14.h,
  );

  /// 14 reg
  static final titleMedium = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.4.h,
  );

  /// 12 bold
  static final titleSmall = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w700,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.16.h,
  );

  /// 12 med
  static final bodyLarge = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.5.h,
  );

  /// 12 reg
  static final bodyMedium = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.5.h,
  );

  /// 10 med
  static final labelLarge = TextStyle(
    fontSize: 10.spMin,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height:1.5.h,
  );

  /// 10 reg
  static final bodySmall = TextStyle(
    fontSize: 10.spMin,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: 1.6,
  );

  /// 11 reg
  static final labelSmall = TextStyle(
    fontSize: 11.spMin,
    fontWeight: FontWeight.normal,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );
}
