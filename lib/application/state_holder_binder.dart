import 'package:e_commerce_app/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}