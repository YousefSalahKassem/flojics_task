part of '../screens/cart_page.dart';

class _CartItem extends StatelessWidget {
  final CartNotifier controller;
  final CartItem item;

  const _CartItem({required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: kVerticalSize10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kVerticalSize18,
            horizontal: kHorizontalSize4,
          ),
          child: Row(
            children: [
              Image.network(
                item.image,
                width: 50.w,
                height: 50.h,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        item.name,
                        style: TextStyles.headlineLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "\$${item.price}",
                      style: TextStyles.headlineMedium
                          .copyWith(color: AppColors.orange),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(kVerticalSize4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.incrementItemQuantity(item),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        item.quantity.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      6.horizontalSpace,
                      GestureDetector(
                        onTap: () => controller.decrementItemQuantity(item),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
