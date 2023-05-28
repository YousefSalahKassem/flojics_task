import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/categories/ui/widgets/categories_list.dart';
import 'package:flojics_task/features/home/ui/widgets/search_filter_bar.dart';
import 'package:flojics_task/features/products/ui/screens/products_list.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        12.heightBox,
        const _Header(),
        12.heightBox,
        const SearchFilterBar(),
        24.heightBox,
        const CategoriesList(),
        24.heightBox,
        const ProductsList(),
      ],
    );
  }
}


class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          LocaleKeys.home_welcome.tr(),
          style: TextStyles.displayLarge.copyWith(fontSize: 20.spMin),
        ),
        Text(
          "${ref.currentUser().name.firstname } ${ref.currentUser().name.lastname}",
          style: TextStyles.headlineMedium.copyWith(fontSize: 20.spMin,height: 0),
        )
      ],
    ),
    );
  }
}
