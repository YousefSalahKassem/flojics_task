part of '../screens/product_details.dart';

class _Description extends StatelessWidget {
  final String description;

  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.productDetails_description.tr(),
          style: TextStyles.headlineMedium,
        ),
        8.verticalSpace,
        Text(
          description,
          style: TextStyles.headlineSmall,
          maxLines: 4,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
