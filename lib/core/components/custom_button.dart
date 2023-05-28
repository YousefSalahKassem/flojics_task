import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/app_animations.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.headlineLarge.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
