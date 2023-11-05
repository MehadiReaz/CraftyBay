class urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String listProductSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String getProductsByRemark(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  // static String getProductsNew = '$_baseUrl/ListProductByRemark/new';
  // static String getProductsPopular = '$_baseUrl/ListProductByRemark/popular';
  // static String getProductsSpecial = '$_baseUrl/ListProductByRemark/special';

  static String getProductDetails(int id) => '$_baseUrl/ProductDetailsById/$id';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String getCartList = '$_baseUrl/CartList';
  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';
}
