import '/index.dart';

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterVendorControllerImp>(
      () => FilterVendorControllerImp(
        categoriesUseCase: Get.find<GetAllCategoriesUseCase>(),
        supCategoriesUseCase: Get.find<GetSupCategoriesUseCase>(),
        cityByIdUseCase: Get.find<GetCityByIdUseCase>(),
        countryUseCase: Get.find<GetCountryUseCase>(),
      ),
      fenix: true,
    );
  }
}
