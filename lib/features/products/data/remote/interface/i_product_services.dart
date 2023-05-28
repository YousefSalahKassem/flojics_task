import 'dart:async';

import 'package:flojics_task/features/products/data/remote/apis/product_service.dart';
import 'package:flojics_task/features/products/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IProductServices {

  static final provider = Provider<IProductServices>((ref) => ProductService.instance);

  Future<List<Product>> getAllProducts();

  Future<List<Product>> getProductsByCategory(String category);

  Future<List<Product>> filterProducts({String? order});
}
