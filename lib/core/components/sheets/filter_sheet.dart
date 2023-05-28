import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/sheet_nob.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/categories/ui/widgets/categories_list.dart';
import 'package:flojics_task/features/products/blocs/notifiers/products_notifier.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterSheet extends ConsumerStatefulWidget {
  const FilterSheet();

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius12),
          topRight: Radius.circular(kRadius12),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const FilterSheet();
      },
    );
  }

  @override
  ConsumerState<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightR(0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius12),
          topRight: Radius.circular(kRadius12),
        ),
      ),
      child: Column(
        children: [
          12.verticalSpace,
          SheetNob.instance.build(context),
          8.verticalSpace,
          const _Header(),
          24.verticalSpace,
          const _Sort(),
        ],
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            LocaleKeys.filter_cancel.tr(),
            style: TextStyles.headlineMedium.copyWith(color: AppColors.red),
          ),
        ),
        Text(
          LocaleKeys.filter_filter.tr(),
          style: TextStyles.headlineMedium,
        ),
        TextButton(
          onPressed: () async {
            await ref.read(ProductsNotifier.provider("").notifier).filterCategories(
              order: ref.watch(selectedOrder),
            );
            ref.read(selectedCategory.notifier).state = '';
            context.pop();
          },
          child: Text(
            LocaleKeys.filter_search.tr(),
            style: TextStyles.headlineMedium.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}

class _Sort extends ConsumerWidget {
  const _Sort();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalSize16),
          child: Text(
            LocaleKeys.filter_order.tr(),
            style: TextStyles.headlineMedium,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: AppColors.orange,
                  hoverColor: AppColors.orange,
                  value: 'desc',
                  groupValue: ref.watch(selectedOrder),
                  onChanged: (String? value) {
                    ref.read(selectedOrder.notifier).state = value ?? '';
                  },
                ),
                Text(
                  LocaleKeys.filter_des.tr(),
                  style: TextStyles.bodyLarge,
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.orange,
                  hoverColor: AppColors.orange,
                  value: 'asec',
                  groupValue: ref.watch(selectedOrder),
                  onChanged: (String? value) {
                    ref.read(selectedOrder.notifier).state = value ?? '';
                  },
                ),
                Text(
                  LocaleKeys.filter_ase.tr(),
                  style: TextStyles.bodyLarge,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}


final selectedOrder = StateProvider.autoDispose<String>((ref) => 'desc');
