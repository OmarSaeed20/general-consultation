import '/index.dart';

class AdvertisementsView extends GetView<AdvertisementsControllerImp> {
  const AdvertisementsView({super.key});

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return Scaffold(
      appBar: BuildAppBar(
        title: Kstrings.advertisements.tr,
        centerTitle: false,
        actions: const [NotificationIconWidget()],
      ),
      body: Obx(
        () => SmartRefreshWidget(
          // scrCtrl: controller.state.value.scrCtrl,
          refCtrl: controller.state.value.refCtrl,
          onRefresh: () => controller.onRefresh(),
          listenable: listenable,
          child: Stack(
            children: [
              ListView(
                controller: controller.state.value.scrCtrl,
                children: [
                  _AdvertisementsBody(controller),
                  if (controller.state.value.rx.isLoadingMore) Loader(size: 55),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: RefreshBody(listenable: listenable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdvertisementsBody extends StatelessWidget {
  const _AdvertisementsBody(this.controller);
  final AdvertisementsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    VideoBinding().dependencies();
    return HandlingRequstView(
      controller.state.value.rx,
      padding: gPadding(top: context.height / 4),
      loading: _ListData(controller: controller),
      onTap: () => controller.getAllAds(),
      title: Kstrings.thereAreNoAdsNow.tr,
      image: Kimage.noAds,
      sub: "",
      child: _ListData(controller: controller),
    );
  }
}

class _ListData extends StatelessWidget {
  const _ListData({required this.controller});

  final AdvertisementsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        // controller: controller.state.value.scrCtrl,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.value.rx.isLoading &&
                controller.state.value.currentPage == 1
            ? 4
            : controller.state.value.allAds.length,
        itemBuilder: (context, index) {
          return AnimationListWidget(
            index: index,
            horizontal: 30,
            child: controller.state.value.rx.isLoading &&
                    controller.state.value.currentPage == 1
                ? const LoadingAds()
                : _AdvertisementsCard(
                    ads: controller.state.value.allAds[index],
                    controller: controller,
                    index: index,
                  ),
          );
        },
      ),
    );
  }
}

class _AdvertisementsCard extends StatelessWidget {
  const _AdvertisementsCard(
      {required this.ads, required this.controller, required this.index});
  final AdsEntity ads;
  final int index;
  final AdvertisementsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    @override
    setAction({
      required String result,
      required int itemId,
      required VendorEntity vendor,
    }) =>
        switch (result) {
          Kstrings.viewProfile => Routes.serviceDetailsPage(vendor),
          Kstrings.requestConsultation => Routes.chatPage(vendor),
          Kstrings.hideAds => DialogManager.showDialogWidget(
              title: Kstrings.alert.tr,
              subtitle: Kstrings.alertHideSup.tr,
              cancelText: Kstrings.noKeepIt.tr,
              img: Kimage.noAds,
              confirmButton: Obx(
                () => Expanded(
                  child: BtnWidget(
                    textStyle: gStyle14(
                      color: KColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    title: Kstrings.yesIWantHideIt.tr,
                    onTap: () => controller.hideAds(selctedId: itemId),
                    rx: controller.state.value.rxHideAds,
                  ),
                ),
              ),
            ),
          _ => () {},
        };

    @override
    Future more(BuildContext context, AdsEntity ads) async {
      var result = await Get.bottomSheet(
        Container(
          height: MediaQuery.sizeOf(context).height * 0.3,
          padding: gPaddingAll(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: 35.radiusCircular),
          ),
          child: ListView(
            children: [
              Container(
                height: 5.h,
                width: 46.w,
                margin: gPaddingSymmetric(horizontal: 160, vertical: 10),
                alignment: Alignment.center,
                color: const Color(0xFF6E7CAF).withOpacity(.11),
              ),
              16.sH,
              ...controller.moreOptions
                  .map((element) => MoreAdsView(option: element))
                  .toList(),
            ],
          ),
        ),
        isScrollControlled: true,
        backgroundColor: KColors.transparent,
      );
      if (!result.toString().isEmptyOrNul) {
        setAction(result: result, itemId: ads.id, vendor: ads.vendor!);
      }
    }

    return Container(
      padding: gPadding(bottom: 6, right: 16, left: 16),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: .3.w, color: KColors.fillBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: gPadding(),
            leading: CircleImageNetWork(url: ads.vendor!.image, size: 32),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  ads.vendor?.name,
                  style: gStyle12(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    PopupMenuButton<String>(
                      color: Colors.white,
                      child: const ImageWidget(path: Kimage.dotsHorizontal),
                      itemBuilder: (context) => [
                        ...List.generate(
                          controller.moreOptions.length,
                          (index) => PopupMenuItem(
                            value: controller.moreOptions[index],
                            child: TextWidget(controller.moreOptions[index].tr),
                            onTap: () => setAction(
                              result: controller.moreOptions[index],
                              itemId: ads.id,
                              vendor: ads.vendor!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            subtitle: TextWidget(
              ads.createdAt.formatDate,
              style: gStyle14(fontSize: 9, color: const Color(0xFFAEAEAE)),
            ),
          ),
          GestureDetector(
            onLongPress: () async => await more(context, ads),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpandableTextWidget(text: ads.description),
                /* TextWidget(
                  ads.description,
                  style: gStyle14(fontSize: 11),
                  padding: gPadding(left: 34, bottom: 8),
                ), */
                if (ads.videoLink != null && Utils.isValiedVideo(ads.videoLink))
                  GetBuilder<VideoControllerImp>(
                    didChangeDependencies: (state) {
                      final VideoPlayerController? videoCtrl =
                          state.controller?.videoPlayerAdsCtrls[index];
                      if (videoCtrl?.value.isPlaying == true) {
                        videoCtrl?.pause();
                      }
                    },
                    dispose: (state) {
                      final VideoPlayerController? videoCtrl =
                          state.controller?.videoPlayerAdsCtrls[index];
                      if (videoCtrl?.value.isPlaying == true) {
                        videoCtrl?.pause();
                      }
                    },
                    builder: (ctrl) => VideoView(
                      videoPlayerCtrl: ctrl.videoPlayerAdsCtrls[index],
                      isLoading: ctrl.isLoadingAds[index],
                      onTappedPlay: () => ctrl.playinitializedVideo(index),
                      onTap: () => ctrl.initVideoCtrls(
                        index: index,
                        url: '${ads.videoLink}',
                      ),
                    ),
                  )
                else if (ads.file != null)
                  ChatImageBody(
                    url: ads.file!,
                    margin: gPadding(bottom: 4, top: 8),
                    height: 165,
                  ),
                // AdsDetailsImage(path: ads.file),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MoreAdsView extends StatelessWidget {
  const MoreAdsView({super.key, required this.option});
  final String option;
  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => Get.back(result: option),
        contentPadding: gPadding(),
        horizontalTitleGap: 0,
        leading: Radio(
          value: option,
          activeColor: KColors.primary,
          groupValue: 0,
          onChanged: (value) => Get.back(result: option),
        ),
        title: TextWidget(
          option.tr,
          style: gStyle16(fontWeight: FontWeight.w500),
        ),
      );
}

class LoadingAds extends StatelessWidget {
  const LoadingAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: gPadding(bottom: 6),
      padding: gPadding(bottom: 6, right: 16, left: 16),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: .3.w, color: KColors.fillBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            contentPadding: gPadding(),
            leading: ShimmerWidget(
              child: Container(
                height: 32.h,
                width: 32.h,
                decoration: const BoxDecoration(
                  color: KColors.fillColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidget(
                  child: Container(
                    height: 5.4.h,
                    width: 80.w,
                    color: KColors.fillColor,
                  ),
                ),
                4.sH,
                Row(
                  children: [
                    PopupMenuButton<String>(
                      color: KColors.fillColor,
                      child: const ImageWidget(path: Kimage.dotsHorizontal),
                      itemBuilder: (context) => [],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget(
                child: Container(
                  height: 4.4.h,
                  width: 80.w,
                  color: KColors.fillColor,
                ),
              ),
              4.sH,
              ShimmerWidget(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * (1 / 5.8),
                  width: MediaQuery.sizeOf(context).width,
                  color: KColors.fillColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
