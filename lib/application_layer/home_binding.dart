import 'package:pokemon/application_layer/home_controller.dart';
import 'package:pokemon/infrastructure_layer/home_repository.dart';

import '../domain_layer/i_home_repository.dart';
import '../network/network_layer.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiBaseHelper>(() => ApiBaseHelper());
    Get.lazyPut<IHomeRepository>(() =>
        HomeRepository(
            apiBaseHelper: Get.find<ApiBaseHelper>()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find<IHomeRepository>()));

  }
}
