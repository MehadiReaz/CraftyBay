import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateWishListController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> setProductInWishList(int producId) async {
    final NetworkResponse response = await NetworkCaller()
        .getRequest(urls.setProductInWishList(producId), isLogin: true);
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Set product wishList failed!';
      return false;
    }
  }
}
