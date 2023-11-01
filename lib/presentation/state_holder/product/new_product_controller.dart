import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewProductController extends GetxController {
  bool _getNewPorductsInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessege = '';

  bool get getNewPorductsInProgress => _getNewPorductsInProgress;

  ProductModel get newProductModel => _newProductModel;

  String get errorMessege => _errorMessege;

  Future<bool> getNewProducts() async {
    _getNewPorductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getProductsByRemark('new'));
    _getNewPorductsInProgress = false;

    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessege = 'New product fetch failed';
      return false;
    }
  }
}
