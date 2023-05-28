import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widgets/cart_item.dart';

part '../widgets/header.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const _Header(),
          12.verticalSpace,
          CartWidget(
            cartBuilder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.cartList.length,
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalSize8),
                  itemBuilder: (context, index) {
                    final item = controller.cartList[index];
                    return Dismissible(
                      key: Key(item.id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        controller.removeItem(item);
                      },
                      background: Container(
                        padding: EdgeInsets.only(left: 200.w),
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30.h,
                        ),
                      ),
                      child: _CartItem(
                        item: item,
                        controller: controller,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          TrolleyCheckOut(
            buttonColor: AppColors.orange,
            buttonTextStyle:
                TextStyles.headlineLarge.copyWith(color: Colors.white),
            shippingFee: 10,
            onCheckout: () {
              UiHelpers.showNotification(LocaleKeys.alerts_soon.tr());
            },
          ),
        ],
      ),
    );
  }
}
