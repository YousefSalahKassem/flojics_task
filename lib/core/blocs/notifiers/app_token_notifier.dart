import 'package:flojics_task/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTokenNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppTokenNotifier>((ref) {
    return AppTokenNotifier();
  });

  String? _token;

  AppTokenNotifier();

  String? get token => _token;

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final result = sharedPreferences.getString(AppConstants.token);
    _token = result;
  }

  Future<void> setToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(AppConstants.token, token);
    _token = token;
    notifyListeners();
  }

  Future<void> clearToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(AppConstants.token);
    _token = '';
    notifyListeners();
  }
}
