import 'dart:io';


import '/index.dart';
import 'create_ads_state.dart';

abstract class CreateAdsController extends GetxController {
  Future<void> onSelectedImage();
  void removeSelectedImage();

  Future<void> createAds();
  // Future<void> deleteAds();
  Future<void> updateAds();
  // Future<void> getAds();
}

class CreateAdsControllerImp extends CreateAdsController {
  CreateAdsControllerImp({
    required this.updateAdsUseCase,
    required this.createAdsUseCase,
    required this.deleteAdsUseCase,
  });
  final CreateAdsUseCase createAdsUseCase;
  final DeleteAdvertisementsUseCase deleteAdsUseCase;
  final UpdateAdvertisementsUseCase updateAdsUseCase;

  final Rx<CreateAdsState> state = CreateAdsState(
    formKey: GlobalKey<FormState>(),
    title: TextEditingController(),
    videoLink: TextEditingController(),
    image: null.obs,
    isImageEmpty: false,
  ).obs;
  @override
  void onInit() {
    if (Get.previousRoute == Routes.myAllAds) {
      state(state.value.copyWith(myAds: Get.arguments["my_ads"]));
      MyAdsEntity? ads = state.value.myAds;
      if (ads != null) {
        CategoriesEntity? selectedService = UserServiceImp.to.categories.value
            .firstWhereOrNull((category) => category.id == ads.categoryId);
        state(
          state.value.copyWith(
            title: ads.description,
            selectedService: selectedService,
            videoLink: ads.videoLink,
          ),
        );
      }
    }
    super.onInit();
  }

  @override
  Future<void> onSelectedImage() async {
    File? resultImg = await Utils.pickPicture();
    state(state.value.copyWith(
      image: (resultImg).obs,
      isImageEmpty: false,
    ));
  }

  @override
  void removeSelectedImage() => state(state.value.copyWith(image: null.obs));

  @override
  Future<void> createAds() async {
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }

    state(state.value.copyWith(rx: handleRxLoading()));

    var param = CreateAdsParameter(
      categoryId: state.value.selectedService!.id,
      description: state.value.title.text,
      image: state.value.image?.value,
      videoLink: state.value.videoLink.text,
    );
    ApiResult<BaseResponse> result = await createAdsUseCase(param);

    result.when(
      success: (data) {
        Get.back();
        toast(data.message);
        state(state.value.copyWith(
          title: "",
          image: null.obs,
          selectedService: null,
          videoLink: "",
          rx: RequestState.success,
        ));
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  @override
  Future<void> updateAds() async {
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }
    state(state.value.copyWith(rx: RequestState.loading));

    var param = UpdateAdvertisementsParameter(
      id: state.value.myAds!.id,
      image: state.value.image?.value,
      categoryId: state.value.selectedService!.id,
      description: state.value.title.value.text,
      videoLink: state.value.videoLink.value.text,
    );
    ApiResult<BaseResponse> result = await updateAdsUseCase(param);

    result.when(
      success: (result) async {
        await MyAdvertisementsControllerImp.to.getAllAds();
        Get.back();
        toast(result.message);
        state(state.value.copyWith(
          rx: RequestState.success,
          title: "",
          image: null.obs,
          selectedService: null,
          videoLink: "",
        ));
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }
}
