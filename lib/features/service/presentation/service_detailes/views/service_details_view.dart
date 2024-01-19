import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '/index.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ServiceDetailsControllerImp>(
      builder: (controller) {
        return Scaffold(
          body: controller.state.value.vendor != null
              ? DefaultTabController(
                  length: controller.tabController.value.length,
                  child: NestedScrollView(
                    // controller: controller.state.value.officeScrollContr,
                    headerSliverBuilder: (context, _) => [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            _AdsDetailsImage(
                              path: controller.state.value.vendor?.image,
                            ),
                            _AdsDetailsDataSection(
                              vendor: controller.state.value.vendor,
                            ),
                          ],
                        ),
                      ),
                    ],
                    body: AdsDetailsDataTypeSection(controller: controller),
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

class _AdsDetailsImage extends StatelessWidget {
  const _AdsDetailsImage({required this.path});
  final String? path;
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: .3.w, color: KColors.fillBorder),
        ),
        child: ImageWidget(
          path: path,
          height: MediaQuery.sizeOf(context).height * .37,
          width: MediaQuery.sizeOf(context).width,
          padding: gPadding(bottom: 16),
        ),
      );
  /*  Container(
        height: 301.h,
        width: context.width,
        margin: gPadding(bottom: 16),
        child: Image.network(Kimage.network2),
      ); */
}

class _AdsDetailsDataSection extends StatelessWidget {
  const _AdsDetailsDataSection({required this.vendor});
  final VendorEntity? vendor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: gPaddingSymmetric(horizontal: 16),
          dense: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget(
                vendor?.name,
                style: gStyle18(fontWeight: FontWeight.w700),
              ),
              6.sW,
              Visibility(
                visible: vendor?.accountVerificationSign == true,
                child: Icon(
                  CupertinoIcons.checkmark_alt_circle_fill,
                  size: 18.h,
                  color: const Color(0xFF2C96FF),
                ),
              ),
            ],
          ),
          subtitle: TextWidget(
            vendor?.serviceDescription,
            style: gStyle12(color: KColors.textGray2),
            padding: gPadding(top: 12),
          ),
        ),
        Padding(
          padding: gPadding(right: 16, left: 16, top: 14),
          child: Row(
            children: [
              RatingBar.builder(
                  initialRating: double.parse(vendor!.avgRate),
                  minRating: .5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 23.r,
                  itemPadding: gPadding(left: 2),
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: KColors.primary),
                  onRatingUpdate: (rating) {} //debugPrint(rating.toString()),
                  ),
              16.sW,
              TextWidget(
                "${(vendor?.avgRate).validate()} ${"rate".tr}",
                style: gStyle12(
                  fontWeight: FontWeight.w700,
                  color: KColors.textGray2,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
