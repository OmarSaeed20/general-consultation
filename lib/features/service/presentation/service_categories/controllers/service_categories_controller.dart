import '/index.dart';

import 'service_categories_state.dart';

abstract class ServiceCategoriesController extends GetxController {
  changeView({bool val = true});
  Future<void> getAllVendors({
    FilterVendorParameter? filter,
    int? page,
    bool isRef = false,
  });
}

class ServiceCategoriesControllerImp extends ServiceCategoriesController {
  ServiceCategoriesControllerImp({required this.allVendorsUseCase});
  final GetAllVendorsUseCase allVendorsUseCase;
  static ServiceCategoriesControllerImp get to =>
      Get.find<ServiceCategoriesControllerImp>();

  final Rx<ServiceCategoriesState> state = ServiceCategoriesState(
    filter: Get.arguments["filter_vendor"],
    scrCtrl: ScrollController(),
    refCtrl: EasyRefreshController(controlFinishRefresh: true),
  ).obs;

  @override
  changeView({bool val = true}) => state(state.value.copyWith(isVertical: val));

  @override
  Future<void> getAllVendors(
      {FilterVendorParameter? filter, int? page, bool isRef = false}) async {
    //debugPrint("======> ${state.value.currentPage}");
    if (filter != null) {
      state(state.value.copyWith(allVendors: [], currentPage: 1));
    }
    state(state.value.copyWith(
      rx: handleRxLoading(isRef: isRef, page: page ?? state.value.currentPage),
    ));
    //debugPrint("======> ${state.value.rx}");
    ApiResult<AllVendorModel> result = await allVendorsUseCase(
      GetVendorsParameter(
        filterParameter: filter ?? state.value.filter,
        page: page ?? state.value.currentPage,
      ),
    );

    result.when(
      success: (data) => _insertChats(data.data!, isRef),
      failure: (e) {
        state(state.value.copyWith(rx: handleRxError(e)));
        handleRefFinish(isRef, refCtrl: state.value.refCtrl, success: false);
      },
    );
  }

  _insertChats(AllVendorEntity result, bool isRef) {
    state(
      state.value.copyWith(
        meta: result.meta,
        allVendors: handlePagenationResponse<VendorEntity>(
          responselist: result.vendors,
          currentList: state.value.allVendors,
          currentPage: state.value.currentPage,
        ),
        rx: handleRxList<VendorEntity>(result.vendors),
      ),
    );
    handleRefFinish(isRef, refCtrl: state.value.refCtrl);
  }
  // }

  void _scrollListener() {
    handleScrListener(
      meta: state.value.meta,
      scrCtrl: state.value.scrCtrl,
      fun: () async {
        state(state.value.copyWith(currentPage: state.value.currentPage + 1));
        await getAllVendors();
      },
    );
  }

  @override
  void onInit() {
    getAllVendors();
    state.value.scrCtrl.addListener(_scrollListener);
    super.onInit();
  }

  Future<void> onRefresh() async {
    state(state.value.copyWith(currentPage: 1));
    await handleOnRefresh(
      controller: state.value.refCtrl,
      fun: getAllVendors(isRef: true),
    );
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
