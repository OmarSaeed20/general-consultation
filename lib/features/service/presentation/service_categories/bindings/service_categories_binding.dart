import '/index.dart';

class ServiceCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCategoriesControllerImp>(
      () => ServiceCategoriesControllerImp(
          allVendorsUseCase: Get.find<GetAllVendorsUseCase>()),
      fenix: true,
    );
  }
}
