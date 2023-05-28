part of '../screens/profile_page.dart';

class _Logout extends ConsumerWidget {
  const _Logout();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        CustomAlertDialog.show(
          context,
          title: LocaleKeys.alerts_askToLogout.tr(),
          onPressed: (_) async {
            await ref.read(LoginProvider.provider.notifier).logout();
            UiHelpers.showNotification(
              LocaleKeys.alerts_logoutSuccessfully.tr(),
            );
            context.router
                .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
          },
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: kVerticalSize12),
          child: Center(
            child: Text(
              LocaleKeys.profile_logout.tr(),
              style: TextStyles.headlineMedium
                  .copyWith(color: AppColors.warnColor),
            ),
          ),
        ),
      ),
    );
  }
}
