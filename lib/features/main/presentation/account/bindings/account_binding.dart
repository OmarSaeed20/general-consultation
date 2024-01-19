import '/index.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountControllerImp>(
      () => AccountControllerImp(
        deleteAccountUseCase: Get.find<DeleteAccountUseCase>(),
        logOutUseCase: Get.find<LogOutUseCase>(),
        // langCtrl: Get.find<ChooseLanguageControllerImp>(),
      ),
    );
  }
}
