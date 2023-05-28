import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/blur_container.dart';
import 'package:flojics_task/core/components/custom_button.dart';
import 'package:flojics_task/core/components/custom_text_field.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/app_images.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/helper/validations.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/authentication/blocs/providers/login_provider.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:velocity_x/velocity_x.dart';

part '../widgets/login_form.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _blurAnimationController;

  @override
  void initState() {
    _blurAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      upperBound: 6,
    );
    super.initState();
    _blurAnimationController.forward();
    _blurAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _blurAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(LoginProvider.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        UiHelpers.showNotification(LocaleKeys.alerts_loginSuccessfully.tr());
        context.router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);

      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        UiHelpers.showNotification(LocaleKeys.alerts_loginFail.tr(),isError: true);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _BackgroundImage(),
          BlurContainer(value: _blurAnimationController.value),
          const _LoginForm(),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.background,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
