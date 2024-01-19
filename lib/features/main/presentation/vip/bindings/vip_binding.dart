import 'package:get/get.dart';

import '../controllers/vip_controller.dart';

class VipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VipController>(
      () => VipController(),
    );
  }
}
