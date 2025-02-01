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
 