import 'package:flutter/cupertino.dart';

import '/index.dart';

class HomeAdsCard extends StatelessWidget {
  const HomeAdsCard(this.vendor, {super.key});
  final VendorEntity vendor;
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
              child: ImageWidget(
                path: vendor.licenseWorkImage,
                fit: BoxFit.cover,
                height: 170,
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
                    4.sH,
                    TextWidget(
                      vendor.serviceDescription,
                      overflow: TextOverflow.ellipsis,
                      style: gStyle10(),
                    ),
                    Padding(
                      padding: gPadding(top: 10),
                      child: RatingBar.builder(
                          initialRating: double.parse(vendor.avgRate),
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
                    ListTile(
                      contentPadding: gPadding(),
                      dense: true,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.location_on_outlined,
                        size: 14.h,
                      ),
                      title: TextWidget(
                        vendor.locationText,
                        style: gStyle10(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: BtnWidget(
                        height: 33,
                        margin: gPadding(left: 6),
                        onTap: () => Routes.serviceDetailsPage(vendor),
                        title: Kstrings.takeTheService.tr,
                        textStyle: gStyle12(color: KColors.white),
                      ),
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
