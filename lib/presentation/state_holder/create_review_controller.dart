import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  bool _createReviewInProgress = false;
  String _message = '';

  bool get createReviewInProgress => _createReviewInProgress;

  String get message => _message;

  Future<bool> createReview(
      String description, int productId, double rating) async {
    _createReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().postRequest(
        urls.setReview, {
      "description": description,
      "product_id": productId,
      "rating": rating
    });
    _createReviewInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Create review failed! Try again';
      return false;
    }
  }
}
