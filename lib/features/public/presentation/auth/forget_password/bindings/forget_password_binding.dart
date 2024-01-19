import '/index.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneForgetControllerImp>(
      () => PhoneForgetControllerImp(
        emailAddressUseCase: Get.find<EmailAddressUseCase>(),
      ),
      fenix: true,
    );
  }
}
