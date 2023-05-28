import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flojics_task/core/constants/end_points.dart';
import 'package:flojics_task/features/authentication/data/remote/interface/i_auth_services.dart';
import 'package:flojics_task/features/authentication/models/request/login_request.dart';
import 'package:flojics_task/features/authentication/models/response/profile_response.dart';

class AuthService extends IAuthServices {
  static final AuthService instance = AuthService._();

  factory AuthService() {
    return instance;
  }

  AuthService._();

  final _dio = Dio();

  @override
  Future<String> login(LoginRequest request) async {
    try {
      final response = await _dio.post(EndPoints.login, data: request.toMap());

      final jsonResponse = response.data;

      final token = jsonResponse['token'].toString();

      return token;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  @override
  Future<ProfileResponse> getUserProfile() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/users/1');
      final json = response.data;
      final profileResponse =
          ProfileResponse.fromJson(json as Map<String, dynamic>);
      return profileResponse;
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}
