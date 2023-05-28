import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flojics_task/core/helper/utils/app_locale.dart';
import 'package:flojics_task/core/my_app.dart';
import 'package:flojics_task/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await EasyLocalization.ensureInitialized();

  initializeFancyCart(
    child: EasyLocalization(
      supportedLocales: AppLocale.locales,
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      startLocale: AppLocale.english,
      fallbackLocale: AppLocale.english,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}
