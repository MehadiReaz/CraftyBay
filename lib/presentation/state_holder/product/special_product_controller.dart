import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialPorductsInProgress = false;

  ProductModel _specialProductModel = ProductModel();

  String _errorMessege = '';

  bool get getSpecialPorductsInProgress => _getSpecialPorductsInProgress;

  ProductModel get specialProductModel => _specialProductModel;

  String get errorMessege => _errorMessege;

  Future<bool> getSpecialProducts() async {
    _getSpecialPorductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getProductsByRemark('new'));
    _getSpecialPorductsInProgress = false;

    if (response.isSuccess) {
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessege = 'Special product fetch failed';
      return false;
    }
  }
}
