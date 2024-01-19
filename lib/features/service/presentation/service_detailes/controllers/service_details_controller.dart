import 'package:nb_utils/nb_utils.dart';

import '/index.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'service_details_state.dart';

abstract class ServiceDetailsController extends GetxController {
  Future<void> getOfficeConsultaionsData();
  Future<void> getVendorCommints();
  Future<void> addVendorCommint();
}

class ServiceDetailsControllerImp extends ServiceDetailsController
    with GetSingleTickerProviderStateMixin {
  ServiceDetailsControllerImp({
    required this.vendorDetailesUseCase,
    required this.addVendorCommintsUseCase,
    required this.getVendorCommintsUseCase,
  });
  final GetOfficeConsultaionsUseCase vendorDetailesUseCase;
  final GetVendorCommintsUseCase getVendorCommintsUseCase;
  final AddVendorCommintsUseCase addVendorCommintsUseCase;

  static ServiceDetailsControllerImp get to =>
      Get.find<ServiceDetailsControllerImp>();

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this).obs;
    // await _initController();
    if (state.value.vendor?.isOffice == true) getOfficeConsultaionsData();

    await getVendorCommints(page: 1);
    if (state.value.commints.isNotEmpty) {
      state.value.commintScrollContr.addListener(_commintsScrollListener);
    }
    if (state.value.officeConsultaions.isNotEmpty) {
      state.value.officeScrollContr.addListener(_officeScrollListener);
    }
    super.onInit();
  }

  // _initController() async {
  // state = ServiceDetailsState(
  //   vendor: Get.arguments["vendor"],
  //   rateMesaage: TextEditingController(),
  //   commintScrollContr: ScrollController(),
  //   officeScrollContr: ScrollController(),
  // ).obs;
  // }

  late Rx<TabController> tabController;

  late final Rx<ServiceDetailsState> state = ServiceDetailsState(
    vendor: Get.arguments["vendor"],
    rateMesaage: TextEditingController(),
    commintScrollContr: ScrollController(),
    officeScrollContr: ScrollController(),
  ).obs;

  @override
  Future<void> getOfficeConsultaionsData({int? page}) async {
    state(
      state.value.copyWith(
        rxConsultaions:
            handleRxLoading(page: page ?? state.value.officeCurrentPage),
      ),
    );
    ApiResult<AllVendorModel> result = await vendorDetailesUseCase(
      OfficeConsultaionsParameter(
        office: state.value.vendor!.id,
        page: page ?? state.value.officeCurrentPage,
      ),
    );
    result.when(
        success: (data) {
          state(
            state.value.copyWith(
              officeMeta: data.data?.meta,
              officeConsultaions: handlePagenationResponse<VendorEntity>(
                responselist: data.data!.vendors,
                currentList: state.value.officeConsultaions,
                currentPage: state.value.officeCurrentPage,
              ),
              rxConsultaions: handleRxList<VendorEntity>(data.data!.vendors),
            ),
          );
          //debugPrint("Consultaions =====> ${state.value.officeConsultaions}");
        },
        failure: (e) =>
            state(state.value.copyWith(rxConsultaions: handleRxError(e))));
  }

  @override
  Future<void> getVendorCommints({int? page}) async {
    state(
      state.value.copyWith(
        rxCommints:
            handleRxLoading(page: page ?? state.value.commintCurrentPage),
      ),
    );
    ApiResult<CommintModel> result = await getVendorCommintsUseCase(
      GetVendorCommintsParameter(
        vendorId: state.value.vendor!.id,
        currentPage: page ?? state.value.commintCurrentPage,
      ),
    );

    result.when(
      success: (data) {
        state(
          state.value.copyWith(
            commintMeta: data.data?.commints?.meta,
            commints: handlePagenationResponse<CommintData>(
              responselist: data.data!.commints!.rates,
              currentList: state.value.commints,
              currentPage: state.value.commintCurrentPage,
            ),
            rxCommints: handleRxList<CommintData>(data.data!.commints!.rates),
          ),
        );
      },
      failure: (e) => state(state.value.copyWith(rxCommints: handleRxError(e))),
    );
  }

  setRate(double val) =>
      state(state.value.copyWith(rateVal: val.toStringAsFixed(0).toInt()));

  setRateMessage(String val) => state(state.value.copyWith(rateMesaage: val));

  @override
  Future<void> addVendorCommint() async {
    state(state.value.copyWith(rxCommints: handleRxLoading()));
    Get.back();
    ApiResult<ContactUsModel> result = await addVendorCommintsUseCase(
      AddVendorCommintsParameter(
        message: state.value.rateMesaage.text,
        rate: state.value.rateVal?.toStringAsFixed(0).toInt(), // 5.1 --> 5
        toUserId: state.value.vendor?.id,
      ),
    );
    result.when(
      success: (data) {
        state(state.value.copyWith(
          rxCommints: RequestState.success,
          rateVal: null,
          rateMesaage: "",
        ));
        getVendorCommints();
      },
      failure: (exceptions) => state(state.value.copyWith(
        rxCommints: handleRxError(exceptions),
        rateVal: null,
        rateMesaage: "",
      )),
    );
  }

  _commintsScrollListener() => handleScrListener(
        scrCtrl: state.value.commintScrollContr,
        fun: () async {
          state(
            state.value.copyWith(
                commintCurrentPage: state.value.commintCurrentPage + 1),
          );
          await getVendorCommints();
        },
        meta: state.value.commintMeta,
      );

  _officeScrollListener() => handleScrListener(
        scrCtrl: state.value.commintScrollContr,
        fun: () async {
          state(
            state.value
                .copyWith(officeCurrentPage: state.value.officeCurrentPage + 1),
          );
          await getVendorCommints();
        },
        meta: state.value.officeMeta,
      );

  @override
  void onClose() {
    tabController.value.dispose();
    state.value.rateMesaage.dispose();
    state.value.commintScrollContr.removeListener(_commintsScrollListener);
    state.value.commintScrollContr.dispose();
    state.value.officeScrollContr.removeListener(_officeScrollListener);
    state.value.officeScrollContr.dispose();
    super.onClose();
  }
}
