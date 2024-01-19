import '/index.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailsControllerImp>(
      () => ServiceDetailsControllerImp(
        vendorDetailesUseCase: Get.find<GetOfficeConsultaionsUseCase>(),
        addVendorCommintsUseCase: Get.find<AddVendorCommintsUseCase>(),
        getVendorCommintsUseCase: Get.find<GetVendorCommintsUseCase>(),
      ),
      fenix: true,
    );
  }
}
