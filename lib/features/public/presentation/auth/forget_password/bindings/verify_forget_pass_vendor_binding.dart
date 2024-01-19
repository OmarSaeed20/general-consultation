import '/index.dart';

class VerifyForgetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailControllerImp>(
      () => VerifyEmailControllerImp(
        Get.find<EmailAddressUseCase>(),
        Get.find<VerifyEmailUseCase>(),
      ),
      fenix: true,
    );
  }
}
