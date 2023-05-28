import 'package:flojics_task/features/authentication/data/remote/apis/auth_service.dart';
import 'package:flojics_task/features/authentication/models/request/login_request.dart';
import 'package:flojics_task/features/authentication/models/response/profile_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAuthServices{

  static final provider = Provider<IAuthServices>((ref) => AuthService.instance);

  Future<String> login(LoginRequest request);

  Future<ProfileResponse> getUserProfile();
}
