
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flojics_task/core/constants/end_points.dart';
import 'package:flojics_task/features/products/data/remote/interface/i_product_services.dart';
import 'package:flojics_task/features/products/models/product.dart';

class ProductService extends IProductServices {
  static final ProductService instance = ProductService._();

  factory ProductService() {
    return instance;
  }

  ProductService._();

  final _dio = Dio();

  @override
  Future<List<Product>> filterProducts({String? order}) async {
    try {
      final response = await _dio.get(
        EndPoints.filterProducts(order),
      );

      final jsonString = jsonEncode(response.data);
      final jsonList = jsonDecode(jsonString) as List<dynamic>;

      final products = jsonList.map((json) {
        if (json is Map<String, dynamic>) {
          return Product.fromJson(json);
        } else {
          throw Exception('Invalid product format: $json');
        }
      }).toList();
      print(products[0].title);
      return products;
    } catch (error) {
      throw Exception('Error occurred while fetching products: $error');
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await _dio.get(EndPoints.products);

      final dynamic responseData = response.data;
      if (responseData is List<dynamic>) {
        final List<Product> products = responseData
            .map(
              (dynamic json) => Product.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        return products;
      } else {
        throw Exception('Invalid response format');
      }
    } catch (error) {
      throw Exception('Error occurred while fetching products: $error');
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await _dio.get(EndPoints.productsByCategory(category));

      final dynamic responseData = response.data;
      if (responseData is List<dynamic>) {
        final List<Product> products = responseData
            .map(
              (dynamic json) => Product.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        return products;
      } else {
        throw Exception('Invalid response format');
      }
    } catch (error) {
      throw Exception('Error occurred while fetching products: $error');
    }
  }
}
