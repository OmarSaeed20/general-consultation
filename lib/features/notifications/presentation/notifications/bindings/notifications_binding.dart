import 'package:general_consultation/index.dart';


class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsControllerImp>(
      () => NotificationsControllerImp(
        getNotificationUseCase: Get.find<GetNotificationUseCase>(),
        blockNotificationUseCase: Get.find<BlockNotificationUseCase>(),
        countUnreadUseCase: Get.find<CountUnreadNotificationsUseCase>(),
      ),
      fenix: true,
    );
  }
}
