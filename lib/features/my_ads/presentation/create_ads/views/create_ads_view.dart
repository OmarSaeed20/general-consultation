import 'package:general_consultation/features/my_ads/presentation/create_ads/controllers/create_ads_controller.dart';

import '/index.dart';

class CreateAdsView extends GetView<CreateAdsControllerImp> {
  const CreateAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: BuildAppBar(title: Kstrings.addNewAds.tr),
          body: Form(
            key: controller.state.value.formKey,
            child: ListView(
              padding: gPadding(right: 15, left: 15, bottom: 15),
              children: [
                AuthHeader(
                  title: Kstrings.addNewAdsSup.tr,
                  padLef: 0,
                  padding: gPaddingSymmetric(vertical: 22),
                  supStyle: gStyle12(color: KColors.textGray2),
                  supTitle: Kstrings.addNewAdsSup2.tr,
                ),
                25.sH,
                CustomDropDownButton<CategoriesEntity>(
                  title: Kstrings.choseService.tr,
                  subTitle: Kstrings.choseService.tr,
                  value: controller.state.value.selectedService,
                  items: UserServiceImp.to.categories.value
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          enabled: e.isActive ?? false,
                          child: TextWidget(
                            e.name.capitalizeFirst,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v?.isActive == true) {
                      controller.state(
                          controller.state.value.copyWith(selectedService: v));
                    }
                  },
                ),
                20.sH,
                TextInputWidget(
                  "",
                  hintText: Kstrings.writeHere.tr,
                  maxLines: 10,
                  fillColor: KColors.white,
                  controller: controller.state.value.title,
                  validator: (value) => Utils.inputValidator('$value'),
                ),
                /*  SelectImagesContent(
                  title: Kstrings.addImgOrVid.tr,
                  subTitle: Kstrings.addImageSup.tr,
                  image: controller.state.value.image?.value,
                  isError: controller.state.value.isImageEmpty,
                  selectCallback: () => controller.onSelectedImage(),
                  cancelCallback: () => controller.removeSelectedImage(),
                ),*/
                20.sH,
                SelectImagesContent(
                  title: Kstrings.addImgOrVid.tr,
                  subTitle: Kstrings.addImgSubTitle.tr,
                  image: controller.state.value.image?.value,
                  adsImage: controller.state.value.myAds?.file,
                  isError: controller.state.value.isImageEmpty,
                  selectCallback: () => controller.onSelectedImage(),
                  cancelCallback: () => controller.removeSelectedImage(),
                ),
                16.sH,
                TextInputWidget(
                  Kstrings.vidLink.tr,
                  hintText: Kstrings.copyVidLink.tr,
                  fillColor: KColors.white,
                  hintStyle: gStyle12(
                    fontWeight: FontWeight.w300,
                    color: KColors.textGray,
                  ),
                  controller: controller.state.value.videoLink,
                  // enabled: (controller.state.value.image == null &&
                  //     controller.state.value.myAds == null),
                ),
                25.sH,
                BtnWidget(
                  onTap: () => controller.state.value.myAds != null
                      ? controller.updateAds()
                      : controller.createAds(),
                  rx: controller.state.value.rx,
                  title: Kstrings.publishAds.tr,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
