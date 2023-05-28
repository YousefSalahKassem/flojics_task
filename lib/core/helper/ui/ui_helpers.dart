import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

mixin UiHelpers {
  static Brightness get windowBrightness {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness;
  }

  //* <------------------------------------------------ Notification & Messages

// Show Notification
  static void showNotification(
    String message, {
    NotificationPosition position = NotificationPosition.bottom,
    int durationInSeconds = 3,
    bool isError = false,
  }) {
    showOverlayNotification(
      (context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: isError ? AppColors.warnColor : AppColors.tealColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: SizedBox(
            width: context.width,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyles.headlineMedium.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      duration: Duration(seconds: durationInSeconds),
      position: position,
    );
  }

  //* <------------------------------------------ Post Frame Callback
  static void postBuildCallback(void Function(Duration) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
}
