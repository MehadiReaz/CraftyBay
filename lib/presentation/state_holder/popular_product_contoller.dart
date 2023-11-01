import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  bool _getPopularPorductsInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessege = '';

  bool get getPopularPorductsInProgress => _getPopularPorductsInProgress;

  ProductModel get popularProductModel => _popularProductModel;

  String get errorMessege => _errorMessege;

  Future<bool> getPopularProducts() async {
    _getPopularPorductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getProductsByRemark('popular'));
    _getPopularPorductsInProgress = false;

    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessege = 'Popular product fetch failed';
      return false;
    }
  }
}
