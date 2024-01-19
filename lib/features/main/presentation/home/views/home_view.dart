import '/index.dart';
import 'home_loading_view.dart';

class HomeView extends GetView<HomeControllerImp> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBinding().dependencies();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: TextWidget(
            "${Kstrings.homeSup1.tr} ${(UserServiceImp.to.currentUser.value?.name).valide()}",
            style: gStyle16(fontWeight: FontWeight.w700),
          ),
          actions: const [NotificationIconWidget()],
        ),
        body: HandlingRequstView(
          controller.state.value.rx,
          loading: const HomeLoadingView(),
          onTap: () => controller.getHome(),
          child: _Body(ctrl: controller),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.ctrl});

  final HomeControllerImp ctrl;

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return SmartRefreshWidget(
      scrCtrl: ctrl.state.value.scrCtrl,
      refCtrl: ctrl.state.value.refCtrl,
      onRefresh: () => ctrl.onRefresh(),
      listenable: listenable,
      child: ListView(
        padding: gPadding(),
        children: [
          Stack(
            children: [
              TextWidget(
                Kstrings.homeSup.tr,
                style: gStyle14(color: KColors.textGray2),
                padding: gPadding(right: 16, bottom: 24),
              ),
              Positioned(
                top: -5,
                right: 0,
                child: RefreshBody(listenable: listenable),
              ),
            ],
          ),
          // const SearchBarWidget(),
          // 24.sH,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ctrl.state.value.homeData != null) ...[
                Visibility(
                  visible: ctrl.state.value.homeData!.data!.banners.isNotEmpty,
                  child: SliderWidget(
                    images: ctrl.state.value.homeData!.data!.banners,
                    onPageChanged: (value, _) {},
                    currentIndex: 1,
                  ),
                ),
                if (ctrl.state.value.homeData!.data!.categories.isNotEmpty) ...[
                  24.sH,
                  TextWidget(
                    Kstrings.profionalServi.tr,
                    style: gStyle16(fontWeight: FontWeight.w700),
                    padding: gPaddingSymmetric(horizontal: 16),
                  ),
                  const ServiceSection(),
                ],
                Container(
                  height: 8.h,
                  width: double.infinity,
                  color: KColors.grey,
                ),
                if (ctrl
                    .state.value.homeData!.data!.vendors.list.isNotEmpty) ...[
                  TitleRowWidget(
                    title: Kstrings.bestConsultants.tr,
                    trailing: TxtBtn(
                      onTap: () => Get.toNamed(
                        Routes.serviceCategories,
                        arguments: {
                          "filter_vendor": const FilterVendorParameter(),
                          "category_name": Kstrings.allCategory,
                        },
                      ),
                      TextWidget(
                        Kstrings.seeAll.tr,
                        style: gStyle12(
                          fontWeight: FontWeight.w700,
                          color: KColors.textGray2,
                        ),
                      ),
                    ),
                  ),
                  HorizontalListBuilder(
                    padding: gPadding(right: 16),
                    itemBuilder: (BuildContext context, int i) => HomeAdsCard(
                      ctrl.state.value.homeData!.data!.vendors.list[i],
                    ),
                    itemCount:
                        ctrl.state.value.homeData!.data!.vendors.list.length,
                  ),
                  10.sH,
                ],
                40.sH,
              ]
            ],
          )
        ],
      ),
    );
  }
}

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({
    super.key,
    this.trailing = const SizedBox.shrink(),
    required this.title,
    this.padding,
    this.titleStyle,
  });
  final String title;
  final TextStyle? titleStyle;
  final Widget trailing;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: padding ?? gPadding(right: 16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title,
            style: titleStyle ?? gStyle16(fontWeight: FontWeight.w700),
          ),
          trailing,
        ],
      ),
    );
  }
}

/* class _WellcomSpace extends StatelessWidget {
  const _WellcomSpace();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(right: 16, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: AuthHeader(
              title:
                  "${Kstrings.homeSup1.tr} ${(UserServiceImp.to.currentUser.value?.name).valide()}",
              supTitle: Kstrings.homeSup.tr,
              padLef: 0,
              padding: gPadding(top: 50),
            ),
          ),
          const NotificationIconWidget()
        ],
      ),
    );
  }
}
 */