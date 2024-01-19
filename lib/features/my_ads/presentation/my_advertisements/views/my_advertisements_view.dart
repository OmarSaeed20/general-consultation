import '/index.dart';

class MyAdvertisementsView extends GetView<MyAdvertisementsControllerImp> {
  const MyAdvertisementsView({super.key});

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return Scaffold(
      appBar: BuildAppBar(
        title: Kstrings.myAds.tr,
        actions: const [NotificationIconWidget()],
      ),
      body: Obx(
        () => SmartRefreshWidget(
          refCtrl: controller.state.value.refCtrl,
          onRefresh: () => controller.onRefresh(),
          listenable: listenable,
          child: Stack(
            children: [
              ListView(
                controller: controller.state.value.scrCtrl,
                children: [
                  _AdvertisementsBody(controller),
                  if (controller.state.value.rx.isLoadingMore) Loader(size: 55)
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
  final MyAdvertisementsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return HandlingRequstView(
      controller.state.value.rx,
      padding: gPadding(bottom: 120),
      image: Kimage.noAds,
      title: "There are no ads now".tr,
      sub: "Post your ad to receive consultants' responses".tr,
      loading: _Body(controller: controller),
      onTap: () => controller.getAllAds(),
      child: _Body(controller: controller),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.controller});

  final MyAdvertisementsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        // controller: controller.state.value.scrCtrl,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.value.rx.isLoading
            ? 4
            : controller.state.value.allAds.length,
        itemBuilder: (context, index) {
          return AnimationListWidget(
            index: index,
            horizontal: 30,
            child: controller.state.value.rx.isLoading
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
  const _AdvertisementsCard({
    required this.ads,
    required this.controller,
    required this.index,
  });
  final MyAdsEntity ads;
  final int index;
  final MyAdvertisementsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    setAcyion({required String result, required MyAdsEntity ads}) =>
        switch (result) {
          Kstrings.editMyAds =>
            Get.toNamed(Routes.createAds, arguments: {"my_ads": ads}),
          Kstrings.deleteMyAds => DialogManager.showDialogWidget(
              title: Kstrings.alert.tr,
              subtitle: Kstrings.alertdeleteSup.tr,
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
                    title: Kstrings.yesIWantDeleteIt.tr,
                    onTap: () => controller.deleteAds(id: ads.id),
                    rx: controller.state.value.rxDelete,
                  ),
                ),
              ),
            ),
          _ => () {},
        };

    Future more(BuildContext context, MyAdsEntity ads) async {
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
      if (!result.toString().isEmptyOrNul) setAcyion(result: result, ads: ads);
    }

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
            contentPadding: gPadding(),
            leading: CircleImageNetWork(url: ads.user?.image, size: 32),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  ads.user?.name,
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
                            onTap: () => setAcyion(
                              result: controller.moreOptions[index],
                              ads: ads,
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
                          state.controller?.videoPlayerMyAdsCtrls[index];
                      if (videoCtrl?.value.isPlaying == true) {
                        videoCtrl?.pause();
                      }
                    },
                    dispose: (state) {
                      final VideoPlayerController? videoCtrl =
                          state.controller?.videoPlayerMyAdsCtrls[index];
                      if (videoCtrl?.value.isPlaying == true) {
                        videoCtrl?.pause();
                      }
                    },
                    builder: (ctrl) => VideoView(
                      videoPlayerCtrl: ctrl.videoPlayerMyAdsCtrls[index],
                      isLoading: ctrl.isLoadingMyAds[index],
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
