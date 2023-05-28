import 'package:flojics_task/core/helper/utils/generic_state.dart';
import 'package:flojics_task/features/categories/data/remote/interface/i_category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<GenericState<List<String>>> {
  static final provider =
      StateNotifierProvider<CategoryNotifier, GenericState<List<String>>>(
    (ref) => CategoryNotifier(
      ref.watch(ICategoryService.provider),
    ),
  );

  final ICategoryService _categoryServices;

  CategoryNotifier(this._categoryServices) : super(GenericState.initial()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      state = GenericState.loading();

      final result = await _categoryServices.getAllCategories();

      state = GenericState.success(result);
    } catch (error) {
      state = GenericState.fail(error.toString());
    }
  }
}
