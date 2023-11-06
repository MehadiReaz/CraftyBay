import 'package:e_commerce_app/presentation/state_holder/add_to_cart_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/cart_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product_details_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/category_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/email_verification_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/home_slider_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/new_product_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/popular_product_contoller.dart';
import 'package:e_commerce_app/presentation/state_holder/product/special_product_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/review_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(ProductListController());
    Get.put(ReviewController());
  }
}
