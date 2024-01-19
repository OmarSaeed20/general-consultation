import '/index.dart';

class ChooseLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLanguageControllerImp>(
      () => ChooseLanguageControllerImp(
        Get.find<AppPreferences>(),
        Get.find<ChangeLangUseCase>(),
      ),
      fenix: true,
    );
  }
}
