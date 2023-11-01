import 'package:e_commerce_app/data/models/category_model.dart';
import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _getCategoryInProgress = false;
  String _message = '';
  CategoryModel _categoryModel = CategoryModel();

  CategoryModel get categoryModel => _categoryModel;
  bool get categoryListInProgress => _getCategoryInProgress;
  String get message => _message;

  Future<bool> getcategoryList() async {
    _getCategoryInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.categoryList);
    _getCategoryInProgress = false;

    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
