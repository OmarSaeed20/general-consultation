import '../../../domain/use_case/home/get_home_usecase.dart';
// import '/sl.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerImp>(
      () => HomeControllerImp(homeUseCase: Get.find<GetHomeUseCase>()),
    );
  }
}
