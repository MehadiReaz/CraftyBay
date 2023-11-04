import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _getProductListInProgress = false;
  String _message = '';
  ProductModel _productModel = ProductModel();

  ProductModel get productModel => _productModel;
  bool get productListInProgress => _getProductListInProgress;
  String get message => _message;

  Future<bool> getProductListByCategoryList(int categoryId) async {
    _getProductListInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getProductByCategory(categoryId));
    _getProductListInProgress = false;

    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  void setProducts(ProductModel productModel) {
    _productModel = productModel;
    update();
  }
}
