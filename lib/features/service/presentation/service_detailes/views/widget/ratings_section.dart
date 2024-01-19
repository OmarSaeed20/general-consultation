import 'package:general_consultation/index.dart';

import 'commint__section.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key, required this.controller});
  final ServiceDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(top: 33),
      child: ListView(
        children: [
          TextWidget(Kstrings.genralRatings.tr, textAlign: TextAlign.center),
          TextWidget(
            controller.state.value.vendor?.avgRate,
            style: gStyle24(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ).paddingOnly(top: 17.h),
          Container(
            alignment: Alignment.center,
            padding: gPaddingSymmetric(vertical: 22),
            child: RatingBar.builder(
              initialRating: double.parse(
                controller.state.value.vendor!.avgRate,
              ),
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 23.r,
              itemPadding: gPadding(left: 2),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: KColors.primary),
              onRatingUpdate: (rating) {
                //debugPrint(rating.toString());
              },
            ),
          ),
          Commints(controller: controller),
          24.sH,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: context.width / 2.5,
              child: BtnWidget(
                height: 50,
                border: Border.all(width: 1.5.w, color: KColors.primary),
                backgroundColor: KColors.transparent,
                title: Kstrings.addRate.tr,
                // radius: 10,
                textStyle: gStyle14(
                    fontWeight: FontWeight.w700, color: KColors.primary),
                onTap: () {
                  DialogManager.showSuccess(
                    _createRateDialogBody(),
                    dialogAnimation: DialogAnimation.SCALE,
                  );
                },
              ),
            ),
          ),
          BtnWidget(
            margin: gPaddingSymmetric(vertical: 12, horizontal: 16),
            title: Kstrings.requestConsultation.tr,
            onTap: () => Routes.chatPage(controller.state.value.vendor!),
          )
        ],
      ),
    );
  }

  Container _createRateDialogBody() {
    return Container(
      padding: gPaddingSymmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: 40.radius,
        color: KColors.scaffoldBackground,
      ),

      // margin: gPaddingSymmetric(horizontal: 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AuthHeader(
              title: Kstrings.addNewRate.tr,
              supTitle: Kstrings.addNewRateSup.tr,
              padLef: 0,
              padding: gPadding(),
            ),
            Container(
              alignment: Alignment.center,
              padding: gPaddingSymmetric(vertical: 22),
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 23.r,
                itemPadding: gPadding(left: 2),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: KColors.primary,
                ),
                onRatingUpdate: (rating) {
                  controller.setRate(rating);
                  // //debugPrint(rating.toString());
                },
              ),
            ),
            TextInputWidget(
              "",
              maxLines: 10,
              fillColor: KColors.transparent,
              hintText: Kstrings.writeHere.tr,
              onChanged: (p0) => controller.setRateMessage(p0!),
              // controller: widget.controller.state.value.rateMesaage,
            ),
            16.sH,
            BtnWidget(
              title: Kstrings.send.tr,
              rx: controller.state.value.rxCommints,
              onTap: () => controller.addVendorCommint(),
            )
          ],
        ),
      ),
    );
  }
}
