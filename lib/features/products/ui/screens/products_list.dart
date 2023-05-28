import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/sheets/filter_sheet.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/features/categories/ui/widgets/categories_list.dart';
import 'package:flojics_task/features/products/blocs/notifiers/products_notifier.dart';
import 'package:flojics_task/features/products/ui/widgets/product_card.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: RefreshIndicator(
        child: Consumer(
          builder: (_, ref, __) {
            final state = ref
                .watch(ProductsNotifier.provider(ref.watch(selectedCategory)));
            return state.when(
              data: (products) {
                return FadeInUp(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    children: products
                        .map((product) => ProductCard(product: product))
                        .toList(),
                  ),
                );
              },
              loading: () => Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
                ),
              ),
              error: (e) {
                return Center(
                  child: Text(LocaleKeys.alerts_unknown.tr()),
                );
              },
            );
          },
        ),
        onRefresh: () async {
          /// check if selected category including category then refresh items per categories
          /// else then refresh last selection in filter

          final selectedCategoryState = ref.watch(selectedCategory);
          if (selectedCategoryState.isNotEmpty) {
            final productsNotifier = ref.read(
              ProductsNotifier.provider(selectedCategoryState).notifier,
            );
            await productsNotifier.fetchProducts();
          } else {
            final selectedOrderFilter = ref.watch(selectedOrder);
            final productsNotifier = ref.read(
              ProductsNotifier.provider(selectedOrderFilter).notifier,
            );
            productsNotifier.filterCategories();
          }
        },
      ),
    );
  }
}
