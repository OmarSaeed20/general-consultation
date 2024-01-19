
import '/index.dart';

class MyAdvertisementsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<MyAdvertisementsControllerImp>(
        () => MyAdvertisementsControllerImp(
          getMyAllAdsUseCase: Get.find<GetMyAllAdsUseCase>(),
          deleteAdvertisementsUseCase: Get.find<DeleteAdvertisementsUseCase>(),
          videoController: Get.find<VideoControllerImp>(),
        ),
        fenix: true,
      );
}
