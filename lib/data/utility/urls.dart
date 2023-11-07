class urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String listProductSlider = '$_baseUrl/ListProductSlider';

  static String categoryList = '$_baseUrl/CategoryList';

  static String getProductsByRemark(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  static String getProductDetails(int id) => '$_baseUrl/ProductDetailsById/$id';

  static String addToCart = '$_baseUrl/CreateCartList';
  static String getCartList = '$_baseUrl/CartList';
  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';

  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String getReview(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
  static String setReview = '$_baseUrl/CreateProductReview';

  static String getWishList = '$_baseUrl/ProductWishList';
  static String setProductInWishList(int producId) =>
      '$_baseUrl/CreateWishList/$producId';
  static String removeProductInWishList(int producId) =>
      '$_baseUrl/RemoveWishList/$producId';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
}
