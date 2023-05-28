import 'package:flojics_task/core/components/custom_loading_indicator.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const CustomLoadingIndicator(
          maxLineHeight: 7,
          radius: 12,
          maxLineWidth: 2,
        ),
        12.heightBox,
        Text(
          "Loading",
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        24.heightBox,
      ],
    );
  }
}
