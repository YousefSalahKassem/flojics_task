import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widgets/options_card.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kVerticalSize10,
              horizontal: kHorizontalSize16,
            ),
            child: _OptionsCard(
              begin: const Color(0xffAF2D68),
              end: const Color(0xff632376),
              categoryName: LocaleKeys.admin_add.tr(),
              onTap: () => context.router.push(const AddProductRoute()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kVerticalSize10,
              horizontal: kHorizontalSize16,
            ),
            child: _OptionsCard(
              begin: const Color(0xffF749A2),
              end: const Color(0xffFF7375),
              categoryName:  LocaleKeys.admin_remove.tr(),
              onTap: () => UiHelpers.showNotification(LocaleKeys.alerts_soon.tr()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kVerticalSize10,
              horizontal: kHorizontalSize16,
            ),
            child: _OptionsCard(
              begin: const Color(0xff00E9DA),
              end: const Color(0xff5189EA),
              categoryName:  LocaleKeys.admin_update.tr(),
              onTap: () => UiHelpers.showNotification(LocaleKeys.alerts_soon.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
