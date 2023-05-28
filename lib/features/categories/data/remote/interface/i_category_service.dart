import 'package:flojics_task/features/categories/data/remote/apis/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ICategoryService {
  static final provider = Provider<ICategoryService>((ref) => CategoryService.instance);

  Future<List<String>> getAllCategories();
}
