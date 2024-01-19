import '/index.dart';

import 'advertisements_state.dart';

abstract class AdvertisementsController extends GetxController {
  Future<void> getAllAds({int? page, bool isRef = false});
  Future<void> hideAds({required int selctedId});
/*   setAction({
    required String result,
    required int itemId,
    required VendorEntity vendor,
  });
  Future more(BuildContext context, AdsEntity ads); */
}

class AdvertisementsControllerImp extends AdvertisementsController {
  AdvertisementsControllerImp({
    required this.hideAdsUseCase,
    required this.getAllAdsUseCase,
    required this.videoController,
  });
  final VideoControllerImp videoController;
  final GetAllAdsUseCase getAllAdsUseCase;
  final HideAdsUseCase hideAdsUseCase;

  static AdvertisementsControllerImp get to =>
      Get.find<AdvertisementsControllerImp>();

  final Rx<AdvertisementsState> state = AdvertisementsState(
    scrCtrl: ScrollController(),
    refCtrl: EasyRefreshController(controlFinishRefresh: true),
  ).obs;

  final List<String> moreOptions = [
    Kstrings.viewProfile,
    Kstrings.requestConsultation,
    Kstrings.hideAds,
    // "تشغيل الاشعارات لهذة المنشورات ",
  ];
  @override
  Future<void> hideAds({required int selctedId}) async {
    state(state.value.copyWith(rxHideAds: handleRxLoading()));
    final result = await hideAdsUseCase(IdOnlyParameter(id: selctedId));
    result.when(
      success: (data) {
        List<AdsEntity> res = state.value.allAds.toList();
        res.removeWhere((ads) => ads.id == selctedId);
        state(state.value.copyWith(
          allAds: res,
          rxHideAds: handleRxList<AdsEntity>(res),
        ));
        Get.back();
        toast(data.message);
      },
      failure: (e) => state(state.value.copyWith(rxHideAds: handleRxError(e))),
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

    final result = await getAllAdsUseCase(
      PageOnlyParameter(page: page ?? state.value.currentPage),
    );
    result.when(
      success: (data) async {
        _insertAds(data.data, isRef);
        await _insertVideos();
      },
      failure: (e) {
        state(state.value.copyWith(rx: handleRxError(e)));
        handleRefFinish(isRef, refCtrl: state.value.refCtrl, success: false);
      },
    );
  }

  _insertAds(AllAdsEntity? result, bool isRef) {
    state(
      state.value.copyWith(
        meta: result?.meta,
        allAds: handlePagenationResponse<AdsEntity>(
          responselist: result!.ads,
          currentList: state.value.allAds,
          currentPage: state.value.currentPage,
        ),
        rx: handleRxList<AdsEntity>(result.ads),
      ),
    );

    handleRefFinish(isRef, refCtrl: state.value.refCtrl);
  }

  _insertVideos() async {
    if (state.value.allAds.isNotEmpty) {
      videoController.videoPlayerAdsCtrls =
          List.generate(state.value.allAds.length, (_) => null);
      videoController.isLoadingAds =
          List.generate(state.value.allAds.length, (_) => false);
      if (state.value.allAds.first.videoLink == null) return;
      await videoController.initVideoCtrls(
        index: 0,
        url: '${state.value.allAds.first.videoLink}',
        // isConsultations: true,
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
