import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/profile_model.dart';
import 'package:e_commerce_app/data/services/network_caller.dart';
import 'package:e_commerce_app/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  String _message = '';
  ProfileModel _readProfileModel = ProfileModel();

  String get message => _message;

  ProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(urls.readProfile, isLogin: true);
    if (response.isSuccess) {
      _readProfileModel = ProfileModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Read profile data fetch failed!';
      return false;
    }
  }
}
