import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required ValueChanged<BuildContext> onPressed,
    String? message,
    Widget? content,
    String? positiveLabel,
    String? negativeLabel,
  }) {
    return showDialog(
      context: context,
      builder: (_) => CustomAlertDialog._(
        title: title,
        onPositive: onPressed,
        message: message,
        content: content,
        positiveLabel: positiveLabel,
        negativeLabel: negativeLabel,
      ),
    );
  }

  final String title;
  final ValueChanged<BuildContext> onPositive;
  final String? message;
  final Widget? content;
  final String? positiveLabel;
  final String? negativeLabel;

  const CustomAlertDialog._({
    required this.title,
    required this.onPositive,
    this.message,
    this.content,
    this.positiveLabel,
    this.negativeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyles.headlineSmall,
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            negativeLabel ?? LocaleKeys.common_no.tr(),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text(
            positiveLabel ?? LocaleKeys.common_yes.tr(),
            style: TextStyles.headlineMedium.copyWith(color: AppColors.warnColor),
          ),
          onPressed: () => onPositive(context),
        ),
      ],
    );
  }
}
