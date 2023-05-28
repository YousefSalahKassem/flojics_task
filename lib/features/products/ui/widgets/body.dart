part of '../screens/product_details.dart';

class _Body extends StatelessWidget {
  final Product product;

  const _Body({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.halfWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius20),
          topRight: Radius.circular(kRadius20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.verticalSpace,
            SheetNob.instance.build(context),
            18.verticalSpace,
            _ProductDetails(product: product),
            10.verticalSpace,
            Text(
              product.category,
              style:
              TextStyles.headlineMedium.copyWith(color: AppColors.orange),
            ),
            24.verticalSpace,
            _AvailableColorWidget(),
            18.verticalSpace,
            _Description(description: product.description),
          ],
        ),
      ),
    );
  }
}
