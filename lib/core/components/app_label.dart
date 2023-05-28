import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const AppLabel({required this.label, this.isRequired = true});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyles.headlineMedium.copyWith(color: Colors.black),
          ),
          if (isRequired)
            TextSpan(
              text: ' *',
              style:
                  TextStyles.headlineLarge.copyWith(color: AppColors.redColor),
            ),
        ],
      ),
    );
  }
}
