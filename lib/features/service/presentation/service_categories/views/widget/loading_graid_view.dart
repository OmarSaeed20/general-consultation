import 'package:general_consultation/index.dart';

class LoadingGraidViewAdsCardBody extends StatelessWidget {
  const LoadingGraidViewAdsCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 9.radius,
        border: Border.all(width: .5.w, color: KColors.fillBorder),
        color: KColors.white,
      ),
      margin: gPadding(right: 8, left: 8, bottom: 15),
      child: ClipRRect(
        borderRadius: 9.radius,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ShimmerWidget(
                child: Container(color: KColors.fillColor),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: gPadding(left: 1, right: 1),
                child: const _LoadingAdsCardBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingAdsCardBody extends StatelessWidget {
  const _LoadingAdsCardBody();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerWidget(
                  child: Container(
                    height: 4.4.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                      borderRadius: 6.radius,
                      color: KColors.fillColor,
                    ),
                  ),
                ),
                8.sW,
                ShimmerWidget(
                  child: CircleAvatar(
                    radius: 10.h,
                    backgroundColor: KColors.fillColor,
                  ),
                )
              ],
            ),
          ),
          ShimmerWidget(
            child: Container(
              height: 4.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: 6.radius,
                color: KColors.fillColor,
              ),
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
                onRatingUpdate: (rating) {} //debugPrint(rating.toString()),
              ),
            ),
          ),
          ShimmerWidget(
            child: Container(
              height: 6,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: 6.radius,
                color: KColors.fillColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
