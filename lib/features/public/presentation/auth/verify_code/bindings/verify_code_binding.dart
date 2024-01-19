import '/index.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyCodeControllerImp>(
      () => VerifyCodeControllerImp(
        Get.find<VerifyCodeUseCase>(),
        Get.find<ResendCodeUseCase>(),
        Get.find<AppPreferences>(),
      ),
      fenix: true,
    );
  }
}
