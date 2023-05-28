part of '../screens/profile_page.dart';

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalSize16),
      child: const Divider(
        color: AppColors.darkGrey,
      ),
    );
  }
}
