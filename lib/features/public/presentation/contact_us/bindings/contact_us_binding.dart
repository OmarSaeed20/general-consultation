import '/index.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsControllerImp>(
      () => ContactUsControllerImp(
          contactUsUseCase: Get.find<ContactUsUseCase>()),
      fenix: true,
    );
  }
}
