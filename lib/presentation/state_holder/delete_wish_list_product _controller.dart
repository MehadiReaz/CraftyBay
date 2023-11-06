import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DeleteWishListProductController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> deleteWishlistProduct(int productId) async {
    final NetworkResponse response = await NetworkCaller()
        .getRequest(urls.removeProductInWishList(productId), isLogin: true);
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Delete wish list product failed!';
      return false;
    }
  }
}
