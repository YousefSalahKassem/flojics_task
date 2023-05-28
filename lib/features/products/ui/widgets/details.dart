part of '../screens/product_details.dart';

class _ProductDetails extends StatelessWidget {
  final Product product;

  const _ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.widthR(0.5),
          child: Text(
            product.title.toUpperCase(),
            maxLines: 2,
            style: TextStyles.headlineLarge,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "\$ ",
                style:
                TextStyles.headlineLarge.copyWith(color: AppColors.orange),
              ),
              TextSpan(
                text: product.price.toString(),
                style: TextStyles.headlineLarge.copyWith(color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
