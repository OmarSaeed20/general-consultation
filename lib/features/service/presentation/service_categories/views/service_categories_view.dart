import 'package:general_consultation/features/main/presentation/home/views/home_loading_view.dart';

import '/index.dart';
import 'widget/vertical_ads_body.dart';

class ServiceCategoriesView extends GetView<ServiceCategoriesControllerImp> {
  const ServiceCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return Obx(
      () {
        return Scaffold(
          appBar: BuildAppBar(
            title: Get.arguments["category_name"] ?? Kstrings.lawServices.tr,
          ),
          body: SmartRefreshWidget(
            // scrCtrl: controller.state.value.scrCtrl,
            refCtrl: controller.state.value.refCtrl,
            onRefresh: () => controller.onRefresh(),
            listenable: listenable,
            child: Stack(
              children: [
                ListView(
                  controller: controller.state.value.scrCtrl,
                  children: [
                    _searchSection(),
                    _title(),
                    HandlingRequstView(
                      // RequestState.Empty,
                      controller.state.value.rx,
                      // image: Kimage.sms,
                      title:
                          "There are no consultants available at this time".tr,
                      sub: "",
                      padding: gPadding(top: 170),
                      loading: (controller.state.value.isVertical)
                          ? _IsVertical(controller: controller)
                          : _IsNotVertical(controller: controller),
                      onTap: () => controller.getAllVendors(),
                      child: (controller.state.value.isVertical)
                          ? _IsVertical(controller: controller)
                          : _IsNotVertical(controller: controller),
                    ),
                    if (controller.state.value.rx.isLoadingMore)
                      Loader(size: 55)
                    /*  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                
                              ],
                            ), */
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: RefreshBody(listenable: listenable),
                ),
              ],
            ),
            /* Stack(
                          children: [
                            DefaultTabController(
                              length: 1,
                              child: controller.state.value.rx.isOffLine
                ? OfflineInterNetWidget(
                    onTap: () => controller.getAllVendors(),
                    rx: controller.state.value.rx,
                  )
                : NestedScrollView(
                    headerSliverBuilder: (context, _) {
                      // context.isSmallTablet
                      return [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              _searchSection().paddingAll(16.h),
                              /*  HorizontalListWidget(
                            padding: gPadding(right: 16),
                            itemBuilder: (context, index) =>
                                _CategoryCard(selcted: index == 0),
                            itemCount: 6,
                          ), */
                              TitleRowWidget(
                                title: Kstrings.allConsultants.tr,
                                trailing: Row(
                                  children: [
                                    _viewHandelleIcon(
                                      img: Kimage.equal,
                                      onTap: () =>
                                          controller.changeView(val: false),
                                      selected: !controller
                                          .state.value.isVertical,
                                    ),
                                    _viewHandelleIcon(
                                      img: Kimage.rowVertical,
                                      onTap: () => controller.changeView(
                                        val: true,
                                      ),
                                      selected:
                                          controller.state.value.isVertical,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    controller: controller.state.value.scrCtrl,
                    body: controller.state.value.allVendors.isEmpty &&
                            !controller.state.value.rx.isLoading
                        ? Padding(
                            padding: gPadding(top: 100),
                            child: NoDataStateWidget(
                              rx: RequestState.empty,
                              title:
                                  "There are no consultants available at this time"
                                      .tr,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.state.value.isVertical)
                                _IsVertical(controller: controller)
                              else
                                _IsNotVertical(controller: controller),
                              if (controller.state.value.rx.isLoadingMore)
                                Loader(size: 55)
                            ],
                          ),
                  ),
                            ),
                            /*    Positioned(
              top: 0,
              right: 0,
              child: RefReshBody(listenable: listenable),
                              ),*/
                          ],
                        ), */
          ),
        );
      },
    );
  }

  TitleRowWidget _title() {
    return TitleRowWidget(
      title: Kstrings.allConsultants.tr,
      trailing: Row(
        children: [
          _viewHandelleIcon(
            img: Kimage.equal,
            onTap: () => controller.changeView(val: false),
            selected: !controller.state.value.isVertical,
          ),
          _viewHandelleIcon(
            img: Kimage.rowVertical,
            onTap: () => controller.changeView(
              val: true,
            ),
            selected: controller.state.value.isVertical,
          ),
        ],
      ),
    );
  }

  _searchSection() => Padding(
        padding: gPaddingSymmetric(horizontal: 16),
        child: TextInputWidget(
          "",
          // enabled: !controller.state.value.rx.isLoading,
          hintText: Kstrings.searchBySpecialistName.tr,
          prefixIcon: Kimage.searchIcon,
          onChanged: (value) => controller.getAllVendors(
            filter: FilterVendorParameter(keyWords: value),
          ),
          suffixIcon: Icons.filter_alt,
          suffixIconColor: KColors.primary,
          onPressed: () => Get.toNamed(
            Routes.filter,
            arguments: {
              "categories_id": controller.state.value.filter.categoryId,
            },
          )?.then(
            (value) {
              if (value != null) {
                //debugPrint("<value> filter is >>>> $value");
                controller.getAllVendors(filter: value, page: 1);
              }
            },
          ),
        ),
      );
  ImageWidget _viewHandelleIcon({
    required String img,
    required VoidCallback onTap,
    required bool selected,
  }) =>
      ImageWidget(
        height: 24,
        path: img,
        color: selected ? KColors.primary : KColors.grey3,
        onTap: onTap,
      );
}

class _IsNotVertical extends StatelessWidget {
  const _IsNotVertical({required this.controller});

  final ServiceCategoriesControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return GraidViewAdsCard(
      // controller: controller.state.value.scrCtrl,
      vendors: controller.state.value.allVendors,
      isLoading: controller.state.value.rx.isLoading,
    );
  }
}

class _IsVertical extends StatelessWidget {
  const _IsVertical({required this.controller});

  final ServiceCategoriesControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => 16.sH,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: gPaddingSymmetric(horizontal: 16),
        itemCount: controller.state.value.rx.isLoading
            ? 6
            : controller.state.value.allVendors.length,
        itemBuilder: (context, index) => AnimationListWidget(
          index: index,
          vertical: 30,
          child: controller.state.value.rx.isLoading
              ? const AdsLoadingCard()
              : VerticalAdsCard(
                  vendor: controller.state.value.allVendors[index],
                ),
        ),
      ),
    );
  }
}

/* class _CategoryCard extends StatelessWidget {
  const _CategoryCard({this.selcted = false});
  final bool selcted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(left: 10),
      padding: gPaddingSymmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
          color: KColors.fillColor2,
          borderRadius: 25.radius,
          border: Border.all(
              color: selcted ? KColors.primary : KColors.fillColor2)),
      child: TextWidget(Kstrings.commarce.tr, style: gStyle12()),
    );
  }
}
 */