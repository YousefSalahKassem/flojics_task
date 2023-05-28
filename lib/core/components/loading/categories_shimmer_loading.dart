import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: context.heightR(0.04),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Shimmer(
              child: Container(
                height: context.heightR(0.05),
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(kRadius10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
