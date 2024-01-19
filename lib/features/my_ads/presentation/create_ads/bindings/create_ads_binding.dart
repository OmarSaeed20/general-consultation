import 'package:general_consultation/features/my_ads/presentation/create_ads/controllers/create_ads_controller.dart';
import 'package:general_consultation/index.dart';

class CreateAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAdsControllerImp>(
      () => CreateAdsControllerImp(
        createAdsUseCase: Get.find<CreateAdsUseCase>(),
        deleteAdsUseCase: Get.find<DeleteAdvertisementsUseCase>(),
        updateAdsUseCase: Get.find<UpdateAdvertisementsUseCase>(),
      ),
      fenix: true,
    );
  }
}
