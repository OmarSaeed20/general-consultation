import 'package:get/get.dart';

import '../controller/map_controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MapControllerImp>(
        () => MapControllerImp(),
        fenix: true,
      );
}
