import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flojics_task/core/components/sheet_nob.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/home/ui/screens/home_screen.dart';
import 'package:flojics_task/features/products/models/product.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widgets/body.dart';

part '../widgets/app_bar.dart';

part '../widgets/available_color.dart';

part '../widgets/description.dart';

part '../widgets/details.dart';

part '../widgets/background_image.dart';

class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _AppBar(),
            Hero(
              tag: product.id,
              child: _BackgroundImage(image: product.image),
            ),
            20.verticalSpace,
            Expanded(
              child: _Body(product: product),
            ),
          ],
        ),
      ),
      floatingActionButton: AddToCartButton(
        cartModel: CartItem(
          id: product.id,
          name: product.title,
          image: product.image,
          price: double.parse(
            product.price.toStringAsFixed(2),
          ),
        ),
        child: AbsorbPointer(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.orange,
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
        ),
        actionAfterAdding: () {
          context.popRoute();
          ref.read(currentIndex.notifier).state = 1;
        },
      ),
    );
  }
}
