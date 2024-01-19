import '/index.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginControllerImp>(
      () => LoginControllerImp(
        loginUseCase: Get.find<LoginUseCase>(),
        prefs: Get.find<AppPreferences>(),
      ),
      fenix: true,
    );
  }
}
