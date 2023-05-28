part of '../screens/login_screen.dart';

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  ConsumerState<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  @override
  void dispose() {
    ref.read(LoginProvider.provider.notifier).userNameController.dispose();
    ref.read(LoginProvider.provider.notifier).passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(LoginProvider.provider.notifier);
    return SafeArea(
      bottom: false,
      child: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalSize16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _Header(),
              const Spacer(),
              CustomTextField(
                controller: controller.userNameController,
                hintText: LocaleKeys.login_username.tr(),
                prefixIcon: Icons.person,
                fillColor: Colors.white70,
                borderRadius: 15.r,
                validator: (value) => value!.validate([validateRequired]),
              ),
              24.heightBox,
              CustomTextField(
                controller: controller.passwordController,
                hintText: LocaleKeys.login_password.tr(),
                fillColor: Colors.white70,
                borderRadius: 15.r,
                isPassword: true,
                prefixIcon: CupertinoIcons.padlock,
                validator: (value) =>
                    value!.validate([validatePassword, validateRequired]),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: Text(
                    LocaleKeys.login_forgotPassword.tr(),
                    style:
                        TextStyles.headlineLarge.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: LocaleKeys.login_signIn.tr(),
                onPressed: () => controller.login(),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.login_dontHaveAnAccount.tr(),
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.login_register.tr(),
                      style: TextStyles.displayLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              24.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.logo);
  }
}
