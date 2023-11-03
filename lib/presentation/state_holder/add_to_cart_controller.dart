import 'dart:developer';

import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _message = '';

  bool get addtoCartInProgressInProgress => _addToCartInProgress;

  String get message => _message;

  Future<bool> addToCart(
      int productId, String color, String size, int quantity) async {
    _addToCartInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().postRequest(urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity,
    });
    log(productId.toString());
    log('color: $color');
    log('Size: $size');
    _addToCartInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
