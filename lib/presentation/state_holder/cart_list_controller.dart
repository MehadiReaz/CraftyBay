import 'package:e_commerce_app/data/models/cart_list_model.dart';
import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;
  String _message = '';
  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;
  bool get cartListInProgress => _getCartListInProgress;
  String get message => _message;

  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getCartLsit);
    _getCartListInProgress = false;

    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
