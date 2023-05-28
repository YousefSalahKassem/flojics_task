import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/dialog/custom_alert_dialog.dart';
import 'package:flojics_task/core/components/profile_image.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/authentication/blocs/providers/login_provider.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widgets/body.dart';
part '../widgets/divider.dart';
part '../widgets/header.dart';
part '../widgets/logout.dart';
part '../widgets/option_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalSize8),
        child: Column(
          children: [
            12.verticalSpace,
            const _Header(),
            12.verticalSpace,
            const _Body(),
            18.verticalSpace,
            const _Logout(),
          ],
        ),
      ),
    );
  }
}





