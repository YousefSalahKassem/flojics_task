// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../features/admin/ui/screens/add_product_screen.dart' as _i5;
import '../../features/authentication/ui/screens/login_screen.dart' as _i2;
import '../../features/authentication/ui/screens/splash_screen.dart' as _i1;
import '../../features/home/ui/screens/home_screen.dart' as _i3;
import '../../features/products/models/product.dart' as _i8;
import '../../features/products/ui/screens/product_details.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailScreen(product: args.product),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddProductRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddProductScreen(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i6.RouteConfig(
          HomeRoute.name,
          path: 'home',
        ),
        _i6.RouteConfig(
          ProductDetailRoute.name,
          path: 'details',
        ),
        _i6.RouteConfig(
          AddProductRoute.name,
          path: 'addProduct',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ProductDetailScreen]
class ProductDetailRoute extends _i6.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({required _i8.Product product})
      : super(
          ProductDetailRoute.name,
          path: 'details',
          args: ProductDetailRouteArgs(product: product),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({required this.product});

  final _i8.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{product: $product}';
  }
}

/// generated route for
/// [_i5.AddProductScreen]
class AddProductRoute extends _i6.PageRouteInfo<void> {
  const AddProductRoute()
      : super(
          AddProductRoute.name,
          path: 'addProduct',
        );

  static const String name = 'AddProductRoute';
}
