import '/index.dart';
import 'general_details_section.dart';
import 'ratings_section.dart';

class AdsDetailsDataTypeSection extends StatelessWidget {
  const AdsDetailsDataTypeSection({super.key, required this.controller});
  final ServiceDetailsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          TabBar(
            indicatorColor: KColors.primary,
            // controller: controller.tabController.value,
            tabs: [
              Tab(
                icon: SizedBox(
                  width: context.width,
                  child: TextWidget(
                    Kstrings.generalDetails.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                icon: SizedBox(
                  width: context.width,
                  child: TextWidget(
                    Kstrings.ratings.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                GeneralDetails(controller: controller),
                Ratings(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: KColors.scaffoldBackground,
                      elevation: 0,
                      child: Container(
                        padding:
                            gPaddingSymmetric(horizontal: 16, vertical: 24),
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
                                    //debugPrint(rating.toString());
                                  },
                                ),
                              ),
                              TextInputWidget(
                                "",
                                maxLines: 10,
                                fillColor: KColors.transparent,
                                hintText: Kstrings.writeHere.tr,
                              ),
                              36.sH,
                              BtnWidget(
                                width: 146,
                                title: Kstrings.send.tr,
                                onTap: () {
                                  Get.back();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ); */
