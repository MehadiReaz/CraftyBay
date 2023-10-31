import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/slider_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _gethomeSliderInProgress = false;
  String _message = '';
  SliderModel _sliderModel = SliderModel();

  SliderModel get sliderModel => _sliderModel;
  bool get homeSliderInProgress => _gethomeSliderInProgress;
  String get message => _message;

  Future<bool> getHomeSlider() async {
    _gethomeSliderInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.listProductSlider);
    _gethomeSliderInProgress = false;

    if (response.isSuccess) {
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
