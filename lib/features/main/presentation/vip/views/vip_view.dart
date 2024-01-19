import '/core/widget/button/default_app_button.dart';

import '/index.dart';

class VipView extends StatelessWidget {
  const VipView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GButton(
                margin: gPadding(right: 16, left: 16, bottom: 22),
                onTap: () {},
                title: Kstrings.continueNow.tr,
              ),
            ],
          ),
          body: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BuildVipHeader(),
                _BuildVipBody(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildVipBody extends StatelessWidget {
  const _BuildVipBody();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(top: 20, right: 16, bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            Kstrings.premiumSubscriptionSup.tr,
            textAlign: TextAlign.start,
            padding: gPadding(left: 16, bottom: 32),
          ),
          TextWidget(
            Kstrings.availablePackage.tr,
            style: gStyle14(fontWeight: FontWeight.w700),
            padding: gPadding(bottom: 21),
          ),
          AnimationLimiter(
            child: Container(
              margin: gPadding(left: 16),
              child: AnimationListWidget(
                index: 1,
                horizontal: 30,
                child: ListTile(
                  contentPadding:
                      gPadding(right: 15, left: 15, top: 15, bottom: 24),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(width: .7.w, color: KColors.grey),
                    borderRadius: 8.radius,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        Kstrings.goldenPackage.tr,
                        style: gStyle16(fontWeight: FontWeight.w700),
                      ),
                      TextWidget(
                        "100 D.K",
                        style: gStyle12(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  subtitle: TextWidget(
                    Kstrings.goldenPackageSup.tr,
                    padding: gPadding(left: 55, top: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildVipHeader extends StatelessWidget {
  const _BuildVipHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: KColors.primary.withOpacity(0.1),
      padding: gPadding(top: 58, right: 16, left: 16, bottom: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            Kstrings.subscriptionPackages.tr,
            style: gStyle16(fontWeight: FontWeight.w700),
          ),
          21.sH,
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 87.h,
                  width: 87.h,
                  decoration: BoxDecoration(
                    borderRadius: 100.radius,
                    border: Border.all(
                      width: 5.w,
                      color: KColors.borderColor,
                    ),
                  ),
                  child: const ImageWidget(path: Kimage.vip),
                ),
                20.sH,
                TextWidget(
                  Kstrings.premiumSubscription.tr,
                  style: gStyle16(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
