part of '../screens/cart_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalSize16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.cart_title.tr(),
                style: TextStyles.displayLarge.copyWith(
                  fontSize: 22.spMin,
                ),
              ),
              const ClearCartButton(
                child: Icon(
                  CupertinoIcons.delete,
                  color: AppColors.orange,
                ),
              )
            ],
          ),
          4.verticalSpace,
          ClearCartButton(
            child: Container(
              height: 2.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(kRadius45),
              ),
            ),
          )
        ],
      ),
    );
  }
}
