part of '../screens/profile_page.dart';

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _OptionTile({
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minVerticalPadding: 0,
      leading: Icon(
        icon,
        color: AppColors.orange,
      ),
      title: Text(
        title,
        style: TextStyles.headlineMedium,
      ),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
