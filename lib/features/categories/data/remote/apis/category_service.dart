import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flojics_task/core/constants/end_points.dart';
import 'package:flojics_task/features/categories/data/remote/interface/i_category_service.dart';

class CategoryService extends ICategoryService {
  static final CategoryService instance = CategoryService._();

  factory CategoryService() {
    return instance;
  }

  CategoryService._();

  final _dio = Dio();

  @override
  Future<List<String>> getAllCategories() async {
    try {
      final response = await _dio.get(EndPoints.categories);
      final data = response.data as List<dynamic>;
      final categories = List<String>.from(data);
      return categories;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
