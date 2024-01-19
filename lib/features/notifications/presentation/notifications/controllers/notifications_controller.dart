import 'package:general_consultation/index.dart';

import 'notifications_state.dart';

abstract class NotificationsController extends GetxController {
  Future<void> getAllNotifications({int? page});
  Future<void> blockNotifications();
  Future<void> countUnread();
}

class NotificationsControllerImp extends NotificationsController {
  NotificationsControllerImp({
    required this.getNotificationUseCase,
    required this.blockNotificationUseCase,
    required this.countUnreadUseCase,
  });
  final GetNotificationUseCase getNotificationUseCase;
  final BlockNotificationUseCase blockNotificationUseCase;
  final CountUnreadNotificationsUseCase countUnreadUseCase;

  static NotificationsControllerImp get to => Get.find();

  final Rx<NotificationsState> state =
      NotificationsState(scrCtrl: ScrollController()).obs;
  @override
  Future<void> countUnread() async {
    state(state.value.copyWith(rx: handleRxLoading()));

    ApiResult<CountUnreadModel> result = await countUnreadUseCase();

    result.when(
      success: (result) {
        state(state.value.copyWith(
          countUnread: result.data!.count,
          rx: RequestState.success,
        ));
        // toast(result.message);
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  @override
  Future<void> blockNotifications() async {
    state(state.value.copyWith(rx: handleRxLoading()));

    ApiResult<AuthenticationModel> result = await blockNotificationUseCase();

    result.when(
      success: (result) {
        UserServiceImp.to.currentUser.value = result.data;
        state(state.value.copyWith(rx: RequestState.success));
        toast(result.message);
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  @override
  Future<void> getAllNotifications({int? page}) async {
    state(state.value.copyWith(
      rx: handleRxLoading(page: page ?? state.value.currentPage),
    ));

    ApiResult<NotificationModel> result = await getNotificationUseCase(
      PageOnlyParameter(page: page ?? state.value.currentPage),
    );

    result.when(
      success: (result) => _insertData(result.data!),
      failure: (e) => state(
        state.value.copyWith(rx: handleRxError(e, showError: true)),
      ),
    );
  }

  _insertData(NotificationEntity result) {
    state(
      state.value.copyWith(
        countUnread: 0,
        meta: result.meta,
        notifications: handlePagenationResponse<NotificationData>(
          responselist: result.notificatiion,
          currentList: state.value.notifications,
          currentPage: state.value.currentPage,
        ),
        rx: handleRxList<NotificationData>(result.notificatiion),
      ),
    );
  }

  void _scrollListener() async {
    handleScrListener(
      scrCtrl: state.value.scrCtrl,
      meta: state.value.meta,
      fun: () async {
        state(state.value.copyWith(currentPage: state.value.currentPage + 1));
        await getAllNotifications();
      },
    );
  }

  @override
  void onInit() async {
    await countUnread();
    state.value.scrCtrl.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    state.value.scrCtrl.removeListener(_scrollListener);
    state.value.scrCtrl.dispose();
    super.dispose();
  }
}
