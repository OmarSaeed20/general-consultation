import '/index.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileControllerImp>(
      () => ProfileControllerImp(
        updateProfileUseCase: Get.find<UpdateProfileUseCase>(),
      ),
      fenix: true,
    );
  }
}
