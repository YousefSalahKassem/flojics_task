import 'package:flojics_task/core/helper/utils/generic_state.dart';
import 'package:flojics_task/features/products/data/remote/interface/i_product_services.dart';
import 'package:flojics_task/features/products/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<GenericState<List<Product>>> {
  static final provider = StateNotifierProvider
      .family<ProductsNotifier, GenericState<List<Product>>, String>(
    (ref, category) => ProductsNotifier(
      ref.watch(IProductServices.provider),
      category,
    ),
  );

  final IProductServices _productServices;
  final String _category;

  ProductsNotifier(this._productServices, this._category)
      : super(GenericState.initial()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    state = GenericState.loading();

    try {
      if (_category == "All") {
        final result = await _productServices.getAllProducts();
        state = GenericState.success(result);
      } else {
        final result = await _productServices.getProductsByCategory(_category);
        state = GenericState.success(result);
      }
    } catch (error) {
      state = GenericState.fail(error.toString());
    }
  }

  Future<void> filterCategories({String? limit, String? order}) async {
    state = GenericState.loading();

    try {
      final result =
          await _productServices.filterProducts(order: order);
      state = GenericState.success(result);
    } catch (error) {
      state = GenericState.fail(error.toString());
    }
  }
}
