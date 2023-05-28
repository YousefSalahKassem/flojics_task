import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/helper/ui/app_svg.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBarItem {
  final Widget icon;

  final Widget? activeIcon;

  final Widget title;

  final Color? selectedColor;

  final Color? unselectedColor;

  CustomBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });

  static List<CustomBottomBarItem> bottomNavItems(int index) => [
        CustomBottomBarItem(
          icon: SvgPicture.asset(
            AppSvg.home,
            color: index == 0 ? Colors.white : AppColors.orange,
          ),
          title: Text(
            LocaleKeys.bottomNavigationBar_home.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
        CustomBottomBarItem(
          icon: Icon(
            CupertinoIcons.shopping_cart,
            color: index == 1 ? Colors.white : AppColors.orange,
          ),
          title:  Text(
            LocaleKeys.bottomNavigationBar_cart.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
        CustomBottomBarItem(
          icon: Icon(
            Icons.admin_panel_settings_outlined,
            color: index == 2 ? Colors.white : AppColors.orange,
          ),
          title:  Text(
            LocaleKeys.bottomNavigationBar_favourite.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
        CustomBottomBarItem(
          icon: SvgPicture.asset(
            AppSvg.profile,
            color: index == 3 ? Colors.white : AppColors.orange,
          ),
          title: Text(
            LocaleKeys.bottomNavigationBar_profile.tr(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ];
}
