import '/index.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterControllerImp>(
      () => RegisterControllerImp(
        registerUseCase: Get.find<RegisterUseCase>(),
        prefs: Get.find<AppPreferences>(),
      ),
      fenix: true,
    );
  }
}
