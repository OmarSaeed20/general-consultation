import '/index.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _WellcomSpaceLoading(),
        // const SearchBarWidget(),
        24.sH,
        ...[
          const SliderLoadingWidget(),
          ...[
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
          ...[
            TitleRowWidget(
              title: Kstrings.bestConsultants.tr,
              trailing: TxtBtn(
                onTap: () {},
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
              itemBuilder: (BuildContext context, int i) =>
                  const AdsLoadingCard(),
              itemCount: 4,
            ),
            10.sH,
          ],
          40.sH,
        ]
      ],
    );
  }
}

class _WellcomSpaceLoading extends StatelessWidget {
  const _WellcomSpaceLoading();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: gPadding(bottom: 10, right: 15),
      title: ShimmerWidget(
        child: Container(
          height: 10,
          width: 15,
          margin: gPadding(left: context.width / 2),
          color: KColors.fillColor,
        ),
      ),
    );
  }
}

class AdsLoadingCard extends StatelessWidget {
  const AdsLoadingCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      margin: gPadding(left: 12),
      decoration: BoxDecoration(
        borderRadius: 9.radius,
        border: Border.all(color: KColors.grey2, width: .5.w),
      ),
      child: ClipRRect(
        borderRadius: 9.radius,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ShimmerWidget(
                child: Container(color: KColors.fillColor, height: 150.h),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: gPadding(top: 6, left: 4, right: 12, bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(
                          child: Container(
                            height: 8.h,
                            width: 90.w,
                            color: KColors.fillColor,
                          ),
                        ),
                      ],
                    ),
                    4.sH,
                    ShimmerWidget(
                      child: Container(
                        height: 4.h,
                        width: 40.w,
                        color: KColors.fillColor,
                      ),
                    ),
                    Padding(
                      padding: gPadding(top: 15, bottom: 15),
                      child: ShimmerWidget(
                        child: RatingBar.builder(
                            initialRating: 0,
                            minRating: .5,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: 15.r,
                            itemPadding: gPadding(left: 2),
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: KColors.primary),
                            onRatingUpdate: (rating) {}
                            //debugPrint(rating.toString()),
                            ),
                      ),
                    ),
                    Container(height: 6, width: 80, color: KColors.fillColor),
                    12.sH,
                    Row(
                      children: [
                        Expanded(
                          child: ShimmerWidget(
                            child: Container(
                              height: 33.h,
                              margin: gPaddingSymmetric(
                                horizontal:
                                    Get.currentRoute == Routes.serviceCategories
                                        ? 0
                                        : 8,
                              ),
                              decoration: BoxDecoration(
                                color: KColors.fillColor,
                                borderRadius: 20.radius,
                              ),
                            ),
                          ),
                        ),
                        if (Get.currentRoute == Routes.serviceCategories)
                          Expanded(
                            child: ShimmerWidget(
                              child: Container(
                                height: (context.isTablet ? 42 : 34).h,
                                // margin: gPadding(bottom: 4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: KColors.fillColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
