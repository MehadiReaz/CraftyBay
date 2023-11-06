import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/review_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _getReviewInProgress = false;
  String _message = '';
  ReviewModel _reviewModel = ReviewModel();

  bool get getReviewInProgress => _getReviewInProgress;

  String get message => _message;

  ReviewModel get reviewModel => _reviewModel;

  Future<bool> getReview(int productId) async {
    _getReviewInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.getReview(productId));
    _getReviewInProgress = false;
    if (response.isSuccess) {
      _reviewModel = ReviewModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'get Review failed! Try again';
      update();
      return false;
    }
  }
}
