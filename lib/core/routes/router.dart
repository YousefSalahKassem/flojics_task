import 'package:auto_route/auto_route.dart';
import 'package:flojics_task/features/admin/ui/screens/add_product_screen.dart';
import 'package:flojics_task/features/authentication/ui/screens/login_screen.dart';
import 'package:flojics_task/features/authentication/ui/screens/splash_screen.dart';
import 'package:flojics_task/features/home/ui/screens/home_screen.dart';
import 'package:flojics_task/features/products/ui/screens/product_details.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute> [
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    CustomRoute(page: LoginScreen, path: 'login',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: HomeScreen, path: 'home',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ProductDetailScreen, path: 'details',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: AddProductScreen, path: 'addProduct',transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)

class $AppRouter {}
