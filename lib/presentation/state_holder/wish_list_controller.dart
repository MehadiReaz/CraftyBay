import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/wish_list_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WishListController extends GetxController {
  bool _getWishListPorductsInProgress = false;
  WishListModel _wishListModel = WishListModel();
  String _errorMessege = '';

  bool get getWishListPorductsInProgress => _getWishListPorductsInProgress;

  WishListModel get wishListModel => _wishListModel;

  String get errorMessege => _errorMessege;

  Future<bool> getWishList() async {
    _getWishListPorductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getWishList, isLogin: true);
    _getWishListPorductsInProgress = false;

    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessege = 'Wish List fetch failed';
      return false;
    }
  }
}
