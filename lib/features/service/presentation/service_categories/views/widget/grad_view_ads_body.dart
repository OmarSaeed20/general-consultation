import 'package:flutter/cupertino.dart';

import '/index.dart';
import 'loading_graid_view.dart';

class GraidViewAdsCard extends StatelessWidget {
  const GraidViewAdsCard({
    super.key,
    required this.vendors,
    required this.isLoading,
    this.controller,
  });
  final List<VendorEntity> vendors;
  final bool isLoading;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        shrinkWrap: true,
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: context.isTablet
            ? 2.0 / 2
            : context.height < 600
                ? (1.5 / 2)
                : (1.7 / 2),
        crossAxisCount: context.isTablet ? 3 : 2,
        children: List.generate(
          isLoading ? 8 : vendors.length,
          (i) => AnimationListWidget(
            index: i,
            horizontal: 30,
            vertical: 30,
            child: isLoading
                ? const LoadingGraidViewAdsCardBody()
                : GestureDetector(
                    onTap: () {
                      if (Get.currentRoute == Routes.serviceDetails) {}
                    },
                    child: GraidViewAdsCardBody(vendors: vendors, i: i)),
          ),
        ),
      ),
    );
  }
}

class GraidViewAdsCardBody extends StatelessWidget {
  const GraidViewAdsCardBody({
    super.key,
    required this.vendors,
    required this.i,
  });

  final List<VendorEntity> vendors;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 9.radius,
        border: Border.all(width: .5.w, color: KColors.fillBorder),
        color: KColors.white,
      ),
      margin: gPadding(right: 8, left: 8, bottom: 15),
      child: GestureDetector(
        onTap: () => Routes.serviceDetailsPage(vendors[i]),
        child: ClipRRect(
          borderRadius: 9.radius,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: ImageWidget(
                  path: vendors[i].image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: gPadding(left: 1, right: 1),
                  child: _GraidViewAdsCardBody(vendor: vendors[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GraidViewAdsCardBody extends StatelessWidget {
  const _GraidViewAdsCardBody({required this.vendor});
  final VendorEntity vendor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(left: 2, right: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: gPadding(top: 10, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  vendor.name,
                  overflow: TextOverflow.ellipsis,
                  style: gStyle14(fontWeight: FontWeight.w700),
                  padding: gPadding(left: 4),
                ),
                Visibility(
                  visible: vendor.accountVerificationSign == true,
                  child: Icon(
                    CupertinoIcons.checkmark_alt_circle_fill,
                    size: 18.h,
                    color: const Color(0xFF2C96FF),
                  ),
                ),
              ],
            ),
          ),
          /* TextWidget(
            vendor.name!,
            style: gStyle14(fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
            padding: gPadding(top: 10, bottom: 4),
          ), */
          TextWidget(
            vendor.serviceDescription!,
            style: gStyle10(),
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: gPadding(top: 10),
            child: RatingBar.builder(
              initialRating: double.parse(vendor.avgRate),
              minRating: .5,
              direction: Axis.horizontal,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 15.r,
              itemPadding: gPadding(left: 2),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: KColors.primary),
              onRatingUpdate: (rating) {
                //debugPrint(rating.toString());
              },
            ),
          ),
          ListTile(
            contentPadding: gPaddingSymmetric(),
            dense: true,
            horizontalTitleGap: 0,
            leading: Icon(Icons.location_on_outlined, size: 14.h),
            title: TextWidget(
              vendor.locationText!,
              style: gStyle10(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
