import '/index.dart';

class AdvertisementsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AdvertisementsControllerImp>(
        () => AdvertisementsControllerImp(
          getAllAdsUseCase: Get.find<GetAllAdsUseCase>(),
          hideAdsUseCase: Get.find<HideAdsUseCase>(),
          videoController: Get.find<VideoControllerImp>(),
        ),
        fenix: true,
      );
}
