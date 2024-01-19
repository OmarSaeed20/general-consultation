import '/index.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainControllerImp>(
      () => MainControllerImp(database: Get.find<AppPreferences>()),
      fenix: true,
    );
  }
}
