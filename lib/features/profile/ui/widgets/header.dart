part of '../screens/profile_page.dart';

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      color: AppColors.whiteColor,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(kVerticalSize16),
            child: ProfileImage(
              radius: kRadius28,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${ref.currentUser().name.firstname} ${ref.currentUser().name.lastname}",
                style: TextStyles.headlineLarge,
              ),
              Text(
                ref.currentUser().email,
                style: TextStyles.headlineSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
