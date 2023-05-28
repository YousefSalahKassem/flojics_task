import 'package:flojics_task/core/helper/utils/generic_state.dart';
import 'package:flojics_task/features/authentication/data/remote/interface/i_auth_services.dart';
import 'package:flojics_task/features/authentication/models/response/profile_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<GenericState<ProfileResponse>> {
  static final provider =
      StateNotifierProvider<ProfileNotifier, GenericState<ProfileResponse>>(
    (ref) => ProfileNotifier(
      ref.watch(IAuthServices.provider),
    ),
  );

  final IAuthServices _authServices;

  ProfileNotifier(this._authServices) : super(GenericState.initial()){
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    try {
      state = GenericState.loading();

      final result = await _authServices.getUserProfile();

      state = GenericState.success(result);
    } catch (error) {
      state = GenericState.fail(error.toString());
    }
  }
}
