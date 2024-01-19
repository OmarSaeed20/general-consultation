import '/index.dart';

class AllChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllChatsControllerImp>(
      () => AllChatsControllerImp(Get.find<GetAllChatsUseCase>()),
      fenix: true,
    );
  }
}
