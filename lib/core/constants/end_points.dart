mixin EndPoints {

  //--------------------- Authentication -----------------------\\
  static String get login => 'https://fakestoreapi.com/auth/login';
  static String get profile => 'https://fakestoreapi.com/users/1';

  //--------------------- products -----------------------\\
  static String get products => 'https://fakestoreapi.com/products';
  static String filterProducts(String? order) => 'https://fakestoreapi.com/products?sort=$order';
  static String product(String id) => 'https://fakestoreapi.com/products/$id';

  //--------------------- categories -----------------------\\
  static String get categories => 'https://fakestoreapi.com/products/categories';
  static String productsByCategory(String category) => 'https://fakestoreapi.com/products/category/$category';

}
