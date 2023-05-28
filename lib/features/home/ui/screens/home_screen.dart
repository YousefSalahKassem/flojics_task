import 'package:flojics_task/core/components/custom_bottom_nav_bar.dart';
import 'package:flojics_task/core/components/fade_indexed_stack.dart';
import 'package:flojics_task/core/components/profile_image.dart';
import 'package:flojics_task/core/helper/ui/app_images.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/features/admin/ui/screens/admin_page.dart';
import 'package:flojics_task/features/cart/ui/screens/cart_page.dart';
import 'package:flojics_task/features/home/models/custom_bottom_bar_item.dart';
import 'package:flojics_task/features/home/ui/screens/home_page.dart';
import 'package:flojics_task/features/profile/ui/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar:AppBar(
              backgroundColor: AppColors.lightGrey,
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Image.asset(AppImages.logo),
              ),
              actions: ref.watch(currentIndex) != 3 ? [
                GestureDetector(
                  // go to profile
                  onTap: ()=> ref.read(currentIndex.notifier).state = 3,
                  child: const ProfileImage(),
                ) ,
                10.widthBox,
              ] : [],
            ),
      body: FadeIndexedStack(
        index: ref.watch(currentIndex),
        children: const [
          HomePage(),
          CartPage(),
          AdminPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(10),
        items: CustomBottomBarItem.bottomNavItems(ref.watch(currentIndex)),
        currentIndex: ref.watch(currentIndex),
        onTap: (index) {
          ref.read(currentIndex.notifier).state = index;
        },
        selectedColorOpacity: 1,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.orange,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

final currentIndex = StateProvider.autoDispose<int>((ref) => 0);
