import 'package:flojics_task/core/helper/ui/app_images.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  final double? radius;
  const ProfileImage({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20.r,
      backgroundColor: AppColors.orange,
      backgroundImage: const AssetImage(AppImages.avatar),
    );
  }
}
