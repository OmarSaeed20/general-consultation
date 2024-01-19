import '/index.dart';

class ChangePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePassControllerImp>(
      () => ChangePassControllerImp(
        updatePasswordUsecase: Get.find<UpdatePasswordUsecase>(),
      ),
      fenix: true,
    );
  }
}
