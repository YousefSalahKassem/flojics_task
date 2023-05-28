import 'package:auto_route/auto_route.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/features/products/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ProductDetailRoute(product: product));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                  ),
                ),
              ),
              Text(
                product.title,
                style: TextStyles.headlineMedium.copyWith(color: Colors.black),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Text(
                product.category,
                style: TextStyles.bodyMedium.copyWith(color: AppColors.orange),
              ),
              Text(
                '\$${product.price}',
                style: TextStyles.displayMedium.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
