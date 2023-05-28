part of '../screens/product_details.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalSize16,
        vertical: kVerticalSize10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AppBarIcon(
            background: AppColors.whiteColor,
            borderColor: AppColors.grey,
            iconColor: AppColors.darkBlue,
            size: 20.h,
            icon: Icons.arrow_back_ios,
            onTap: () => context.popRoute(),
          ),
          _AppBarIcon(
            background: AppColors.whiteColor,
            borderColor: Colors.transparent,
            iconColor: AppColors.redColor,
            size: 20.h,
            icon: Icons.favorite,
            haveShadow: true,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _AppBarIcon extends StatelessWidget {
  final Color background;
  final Color borderColor;
  final Color iconColor;
  final double size;
  final IconData icon;
  final VoidCallback onTap;
  final bool haveShadow;

  const _AppBarIcon({
    required this.background,
    required this.borderColor,
    required this.iconColor,
    required this.size,
    required this.icon,
    required this.onTap,
    this.haveShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalSize10,
          vertical: kVerticalSize10,
        ),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: haveShadow
              ? const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Icon(icon, color: iconColor, size: size),
      ),
    );
  }
}
