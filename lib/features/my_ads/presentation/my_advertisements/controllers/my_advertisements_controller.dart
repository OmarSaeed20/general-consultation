import '/index.dart';

import 'my_advertisements_state.dart';

abstract class MyAdvertisementsController extends GetxController {
  Future<void> getAllAds();
  Future<void> deleteAds({required int id});
  // setAcyion({required String result, required MyAdsEntity ads});
  // Future more(BuildContext context, MyAdsEntity ads);
}

class MyAdvertisementsControllerImp extends MyAdvertisementsController {
  MyAdvertisementsControllerImp({
    required this.getMyAllAdsUseCase,
    required this.deleteAdvertisementsUseCase,
    required this.videoController,
  });
  final VideoControllerImp videoController;
  final GetMyAllAdsUseCase getMyAllAdsUseCase;
  final DeleteAdvertisementsUseCase deleteAdvertisementsUseCase;

  static MyAdvertisementsControllerImp get to =>
      Get.find<MyAdvertisementsControllerImp>();

  final Rx<MyAdvertisementsState> state = MyAdvertisementsState(
    scrCtrl: ScrollController(),
    refCtrl: EasyRefreshController(controlFinishRefresh: true),
  ).obs;

  final List<String> moreOptions = [
    Kstrings.editMyAds,
    Kstrings.deleteMyAds,
    // Kstrings.hideAds,
  ];

  @override
  Future<void> deleteAds({required int id}) async {
    state(state.value.copyWith(rxDelete: handleRxLoading()));
    ApiResult<BaseResponse> result = await deleteAdvertisementsUseCase(
      IdOnlyParameter(id: id),
    );
    result.when(
      success: (data) {
        List<MyAdsEntity> res = state.value.allAds.toList();
        res.removeWhere((ads) => ads.id == id);
        state(state.value.copyWith(allAds: res));
        Get.back();
        state(
          state.value.copyWith(
            rxDelete: RequestState.success,
            rx: handleRxList<MyAdsEntity>(res),
          ),
        );
        toast(data.message);
      },
      failure: (e) => state(state.value.copyWith(rxDelete: handleRxError(e))),
    );
  }

  @override
  Future<void> getAllAds({int? page, bool isRef = false}) async {
    state(
      state.value.copyWith(
        rx: handleRxLoading(
          isRef: isRef,
          page: page ?? state.value.currentPage,
        ),
      ),
    );
    ApiResult<MyAllAdsModel> result = await getMyAllAdsUseCase(
      PageOnlyParameter(page: page ?? state.value.currentPage),
    );
    result.when(
      success: (data) async {
        _insertMyAds(data.data!, isRef);
        await _insertVideos();
      },
      failure: (e) {
        state(state.value.copyWith(rx: handleRxError(e)));
        handleRefFinish(isRef, refCtrl: state.value.refCtrl, success: false);
      },
    );
  }

  _insertMyAds(MyAllAdsEntity result, bool isRef) {
    debugPrint("lenght  ${result.ads.length}");
    debugPrint("current  ${result.meta.currentPage}");
    debugPrint("last  ${result.meta.lastPage}");
    state(
      state.value.copyWith(
        meta: result.meta,
        allAds: handlePagenationResponse<MyAdsEntity>(
          responselist: result.ads,
          currentList: state.value.allAds,
          currentPage: state.value.currentPage,
        ),
        rx: handleRxList<MyAdsEntity>(result.ads),
      ),
    );

    handleRefFinish(isRef, refCtrl: state.value.refCtrl);
  }

  _insertVideos() async {
    if (state.value.allAds.isNotEmpty) {
      videoController.videoPlayerMyAdsCtrls =
          List.generate(state.value.allAds.length, (_) => null);
      videoController.isLoadingMyAds =
          List.generate(state.value.allAds.length, (_) => false);
      if (state.value.allAds.first.videoLink == null) return;
      await videoController.initVideoCtrls(
        index: 0,
        url: '${state.value.allAds.first.videoLink}',
      );
    }
  }

  void _scrollListener() => handleScrListener(
        meta: state.value.meta,
        scrCtrl: state.value.scrCtrl,
        fun: () async {
          state(state.value.copyWith(currentPage: state.value.currentPage + 1));
          await getAllAds();
        },
      );

  Future<void> onRefresh() async {
    state(state.value.copyWith(currentPage: 1));
    await handleOnRefresh(
      controller: state.value.refCtrl,
      fun: getAllAds(isRef: true),
    );
    NotificationsControllerImp.to.countUnread();
  }

  @override
  void onInit() {
    getAllAds();
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
}
