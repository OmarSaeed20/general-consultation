import '/index.dart';

class CustomerInquiriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerInquiriesControllerImp>(
      () => CustomerInquiriesControllerImp(
        sendComplaintUseCase: Get.find<SendComplaintUseCase>(),
      ),
      fenix: true,
    );
  }
}
