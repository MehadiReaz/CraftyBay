import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_details.dart';
import 'package:e_commerce_app/data/models/product_details_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';

  List<String> _availableColors = [];

  List<String> _availableSizes = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails get productDetails => _productDetails;

  String get errorMessage => _errorMessage;

  List<String> get availableColors => _availableColors;

  List<String> get availableSizes => _availableSizes;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      _convertStringToColor(_productDetails.color ?? '');
      _convertStringToSizes(_productDetails.size ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Fetch Product details failed';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    _availableColors.clear();
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}
