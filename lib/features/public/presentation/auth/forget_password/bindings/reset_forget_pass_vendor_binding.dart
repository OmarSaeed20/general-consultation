import '/index.dart';

class ResetForgetPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordControllerImp>(
      () => ResetPasswordControllerImp(
        resetPasswordUseCase: Get.find<ResetPasswordUseCase>(),
      ),
      fenix: true,
    );
  }
}
