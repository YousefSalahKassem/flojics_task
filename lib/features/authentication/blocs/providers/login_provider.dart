import 'package:flojics_task/core/blocs/notifiers/app_token_notifier.dart';
import 'package:flojics_task/core/helper/utils/generic_state.dart';
import 'package:flojics_task/features/authentication/data/remote/interface/i_auth_services.dart';
import 'package:flojics_task/features/authentication/models/request/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<GenericState<String>> {
  static final provider =
      StateNotifierProvider<LoginProvider, GenericState<String>>(
    (ref) => LoginProvider(
      ref.watch(IAuthServices.provider),
      ref.watch(AppTokenNotifier.provider),
    ),
  );

  final IAuthServices _authServices;
  final AppTokenNotifier _tokenNotifier;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  LoginProvider(this._authServices, this._tokenNotifier)
      : super(GenericState.initial());

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        state = GenericState.loading();
        final request = LoginRequest(
          username: userNameController.text,
          password: passwordController.text,
        );

        final result = await _authServices.login(request);

        _tokenNotifier.setToken(result);

        state = GenericState.success(result);
      } catch (error) {
        state = GenericState.fail(error.toString());
      }
    }
  }

  Future<void> logout() async {
    await _tokenNotifier.clearToken();
  }
}
