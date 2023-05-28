import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetNob {
  static final SheetNob instance = SheetNob._internal();

  factory SheetNob() {
    return instance;
  }

  SheetNob._internal();

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(kRadius45),
        ),
      ),
    );
  }
}