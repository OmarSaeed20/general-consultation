import 'package:flutter/cupertino.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '/index.dart';

class VerticalAdsCard extends StatelessWidget {
  const VerticalAdsCard({super.key, required this.vendor});
  final VendorEntity vendor;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 310.w,
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
              child: CachedNetworkImage(
                imageUrl: vendor.image,
                fit: BoxFit.fill,
                // width: size.h,
                height: (context.isTablet ? 200 : 165).h,
                errorWidget: (BuildContext context, _, stackTrace) => Center(
                  child: Container(
                    padding: gPaddingAll(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: KColors.fillBorder),
                    ),
                    child: const Icon(Icons.error),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const BlurHash(hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*"),
              ), /* Image.network(
                vendor.image,
                fit: BoxFit.fill,
                
                height: (context.isTablet ? 200 : 165),
              ),
 */
            ),
            Expanded(
              flex: 6,
              child: _VerticalAdsCardBody(vendor: vendor),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalAdsCardBody extends StatelessWidget {
  const _VerticalAdsCardBody({required this.vendor});

  final VendorEntity vendor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(top: 6, left: 4, right: 12, bottom: 6),
      // color: KColors.greyLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                vendor.name,
                overflow: TextOverflow.ellipsis,
                style: gStyle14(fontWeight: FontWeight.w700),
                padding: gPadding(left: 4),
              ),
              if (vendor.accountVerificationSign == true)
                Icon(
                  CupertinoIcons.checkmark_alt_circle_fill,
                  size: 18.h,
                  color: const Color(0xFF2C96FF),
                ),
            ],
          ),
          4.sH,
          TextWidget(vendor.serviceDescription!, style: gStyle10()),
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
              vendor.locationText,
              style: gStyle10(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: BtnWidget(
                  height: context.isTablet ? 44 : 33,
                  margin: gPadding(left: 4),
                  // padding: gPaddingSymmetric(vertical: 8),
                  onTap: () => Routes.serviceDetailsPage(vendor),
                  title: Kstrings.showDetailes.tr,
                  textStyle: gStyle12(color: KColors.white),
                ),
              ),
              Container(
                height: (context.isTablet ? 42 : 34).h,
                margin: gPadding(bottom: 4),
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                ),
                child: ImageWidget(
                  path: Kimage.messages,
                  onTap: () => Routes.chatPage(vendor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
