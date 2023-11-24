import 'package:get/get.dart';
import 'package:untitled1/Controller/HomeController.dart';

class ControllerBindings extends Bindings{

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}