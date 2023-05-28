part of '../screens/product_details.dart';

class _BackgroundImage extends StatelessWidget {
  final String image;

  const _BackgroundImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.contain,
      height: context.heightR(0.3),
      width: context.width,
    );
  }
}
