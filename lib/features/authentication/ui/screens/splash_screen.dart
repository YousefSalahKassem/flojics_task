import 'package:auto_route/auto_route.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/app_animations.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/features/authentication/blocs/notifiers/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn = await ref.isLoggedIn();
    if (isLoggedIn) {
      await ref.read(ProfileNotifier.provider.notifier).getUserProfile();
      context.router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    } else {
      context.router.pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
    }
  }

  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, value, child) {
            return Material(
              color: AppColors.halfWhite,
              borderRadius: BorderRadius.circular(500),
              child: Lottie.asset(
                AppAnimations.splashAnimation,
                frameRate: FrameRate(60),
                width: context.percentWidth *
                    (double.parse(value.toString()) * 55),
              ),
            );
          },
        ),
      ),
    );
  }
}
