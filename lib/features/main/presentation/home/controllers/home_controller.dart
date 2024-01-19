import '/features/main/presentation/home/controllers/home_state.dart';
import '/index.dart';

abstract class HomeController extends GetxController {
  Future<void> getHome({bool isRef = false});
}

class HomeControllerImp extends HomeController {
  HomeControllerImp({required this.homeUseCase});
  static HomeControllerImp get to => Get.find<HomeControllerImp>();
  final GetHomeUseCase homeUseCase;
  final Rx<HomeState> state = HomeState(
    scrCtrl: ScrollController(),
    refCtrl: EasyRefreshController(controlFinishRefresh: true),
  ).obs;
  @override
  void onInit() {
    getHome();
    super.onInit();
  }

  @override
  Future<void> getHome({bool isRef = false}) async {
    state(state.value.copyWith(rx: handleRxLoading(isRef: isRef, page: 1)));
    var result = await homeUseCase();
    result.when(
      success: (data) {
        state(state.value.copyWith(rx: RequestState.success, homeData: data));
        UserServiceImp.to.categories.value = data.data!.categories;
        handleRefFinish(isRef, refCtrl: state.value.refCtrl);
      },
      failure: (e) {
        state(
          state.value.copyWith(
            rx: handleRxError(e),
            error: NetworkExceptions.getErrorMessage(e),
          ),
        );
        handleRefFinish(isRef, refCtrl: state.value.refCtrl, success: false);
      },
    );
  }

  Future<void> onRefresh() async {
    await handleOnRefresh(
      controller: state.value.refCtrl,
      fun: getHome(isRef: true),
    );
    NotificationsControllerImp.to.countUnread();
  }

  @override
  void dispose() {
    state.value.refCtrl.dispose();
    state.value.scrCtrl.dispose();
    super.dispose();
  }
}
