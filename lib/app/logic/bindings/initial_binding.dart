import 'package:get/get.dart';
import 'package:theme_app/app/logic/controllers/theme_controller.dart';




class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
