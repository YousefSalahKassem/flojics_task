import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/loading/categories_shimmer_loading.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/categories/blocs/notifiers/category_notifier.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final state = ref.watch(CategoryNotifier.provider);
        return state.when(
          data: (categories) {
            final allCategories = [
              'All',
              ...categories
            ]; // Add 'All' at the beginning
            return SizedBox(
              height: 45.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allCategories.length,
                itemBuilder: (context, index) {
                  final item = allCategories[index];
                  return _CategoryCard(item: item);
                },
              ),
            );
          },
          loading: () => const CategoriesShimmerLoading(),
          error: (_) => Center(
            child: Text(
              LocaleKeys.alerts_unknown.tr(),
              style: TextStyles.bodyLarge,
            ),
          ),
        );
      },
    );
  }
}

class _CategoryCard extends ConsumerWidget {
  final String item;

  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategory.notifier).state = item;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          border: Border.all(
              color: ref.watch(selectedCategory) == item
                  ? Colors.transparent
                  : AppColors.orange,
          ),
          color: ref.watch(selectedCategory) == item ? AppColors.orange : null,
          borderRadius: BorderRadius.circular(kRadius10),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyles.headlineMedium.copyWith(
              color: ref.watch(selectedCategory) == item
                  ? Colors.white
                  : AppColors.orange,
            ),
          ),
        ),
      ),
    );
  }
}

final selectedCategory = StateProvider.autoDispose<String>((ref) => 'All');
