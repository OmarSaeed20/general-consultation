import '/features/chat/presentation/all_chats/controllers/all_cahts_state.dart';
import '/index.dart';

abstract class AllChatsController extends GetxController {
  Future<void> getChats();
}

class AllChatsControllerImp extends AllChatsController {
  AllChatsControllerImp(this._getChatsUseCase);
  final GetAllChatsUseCase _getChatsUseCase;

  final Rx<AllChatsState> state = AllChatsState(
    scrCtrl: ScrollController(),
    refCtrl: EasyRefreshController(controlFinishRefresh: true),
  ).obs;

  @override
  Future<void> getChats({bool isRef = false}) async {
    //debugPrint("val ======> ${state.value.currentPage}");
    state(state.value.copyWith(
      rx: handleRxLoading(
        isRef: isRef,
        page: state.value.currentPage,
      ),
    ));

    ApiResult<AllChatsModel> result = await _getChatsUseCase(
      AllChatsParameter(page: state.value.currentPage),
    );

    result.when(
      success: (result) => _insertChats(result.data!, isRef),
      failure: (failure) => _failer(failure, isRef),
    );
  }

  _failer(NetworkExceptions exceptions, bool isRef) {
    state(state.value.copyWith(rx: handleRxError(exceptions)));
    handleRefFinish(isRef, refCtrl: state.value.refCtrl, success: false);
  }

  _insertChats(AllChatsEntity result, bool isRef) {
    state(
      state.value.copyWith(
        meta: result.meta,
        allChats: handlePagenationResponse<AllChatData>(
          currentList: state.value.allChats,
          responselist: result.list,
          currentPage: state.value.currentPage,
        ),
        rx: handleRxList<AllChatData>(result.list),
      ),
    );
    handleRefFinish(isRef, refCtrl: state.value.refCtrl);
  }

  void _scrollListener() => handleScrListener(
        scrCtrl: state.value.scrCtrl,
        meta: state.value.meta,
        fun: () async {
          state(state.value.copyWith(currentPage: state.value.currentPage + 1));
          await getChats();
        },
      );

  @override
  void onInit() async {
    await getChats();
    state.value.scrCtrl.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    handleDisposeScrAndRefCtrl(
      scrCtrl: state.value.scrCtrl,
      fun: _scrollListener,
      refCtrl: state.value.refCtrl,
    );
    super.dispose();
  }

  Future<void> onRefresh() async {
    state(state.value.copyWith(currentPage: 1));
    await handleOnRefresh(
      controller: state.value.refCtrl,
      fun: getChats(isRef: true),
    );
    NotificationsControllerImp.to.countUnread();
  }
}
