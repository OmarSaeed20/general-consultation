// import 'package:nb_utils/nb_utils.dart';

import '/index.dart';

class ServiceSection extends GetView<HomeControllerImp> {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AnimationLimiter(
            child: Wrap(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              direction: Axis.horizontal,
              children: [
                if (controller.state.value.rx.isLoading)
                  ...List.generate(8, (i) => _ServiceLoadingIcon(i))
                else if (controller.state.value.homeData?.data != null)
                  ...controller.state.value.homeData!.data!.categories
                      .map(
                        (e) => Visibility(
                          visible: e.isActive != false,
                          child: _ServiceIcon(
                            id: e.id,
                            img: e.image,
                            title: e.name,
                            bColor: const Color(0xFF277FF2).withOpacity(.1),
                          ),
                        ),
                      )
                      .toList(),
              ],
            ),
          ),
          24.sH,
        ],
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  const _ServiceIcon({
    required this.bColor,
    required this.img,
    required this.id,
    required this.title,
  });
  final Color bColor;
  final String? img, title;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: gPadding(left: 12, right: 12, top: 10),
      child: GestureDetector(
        onTap: () => Get.toNamed(
          Routes.serviceCategories,
          arguments: {
            "filter_vendor": FilterVendorParameter(categoryId: id),
            "category_name": title,
          },
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: (context.width < 385 ? 29 : 34).h,
              backgroundColor: bColor,
              child: ClipRRect(
                borderRadius: 200.radius,
                child: ImageWidget(path: img),
              ),
            ),
            8.sH,
            SizedBox(
              width: context.width * .18,
              child: TextWidget(
                title?.tr,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceLoadingIcon extends StatelessWidget {
  const _ServiceLoadingIcon(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimationListWidget(
      index: index,
      vertical: 30,
      milliseconds: 750,
      child: Padding(
        padding: gPadding(left: 12, right: 12, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerWidget(
              child:
                  CircleAvatar(radius: (34).h, backgroundColor: KColors.grey),
            ),
            8.sH,
            ShimmerWidget(
              child: Container(
                height: 3.4.h,
                width: context.width * .18,
                color: KColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
