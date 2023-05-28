part of '../screens/profile_page.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          _OptionTile(
              title: LocaleKeys.profile_settings.tr(),
              onTap: () {
                UiHelpers.showNotification(LocaleKeys.alerts_soon.tr());
              },
              icon: Icons.settings,
          ),
          const _Divider(),
          _OptionTile(
              title: LocaleKeys.profile_about.tr(),
              onTap: () {
                UiHelpers.showNotification(LocaleKeys.alerts_soon.tr());
              },
              icon: Icons.info_outline_rounded,
          ),
          const _Divider(),
          _OptionTile(
              title: LocaleKeys.profile_commonQuestions.tr(),
              onTap: () {
                UiHelpers.showNotification(LocaleKeys.alerts_soon.tr());
              },
              icon: Icons.question_mark_rounded,
          ),
          const _Divider(),
          _OptionTile(
              title: LocaleKeys.profile_support.tr(),
              onTap: () {
                UiHelpers.showNotification(LocaleKeys.alerts_soon.tr());
              },
              icon: Icons.chat_outlined,
          ),
        ],
      ),
    );
  }
}
