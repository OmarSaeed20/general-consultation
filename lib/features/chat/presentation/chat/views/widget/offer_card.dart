import '/index.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPaddingAll(15),
      margin: gPadding(top: 5, left: 15, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: KColors.fillBorder),
        borderRadius: 15.radius,
      ),
      child: Column(
        children: [
          AuthHeader(
            title: "تم ارسال عرض من قبل أحمد ابراهيم",
            titStyle: gStyle14(fontWeight: FontWeight.w700),
            padding: gPadding(),
            supTitle:
                "هذا النص هو مثال لتفاصيل العرض الذي قام المحامى بارسالة الى العميل ",
            padLef: 48,
          ),
          14.sH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                "التكلفة: 20 \$",
                style: gStyle12(fontWeight: FontWeight.w700),
              ),
              TextWidget(
                "قبول العرض",
                style: gStyle12(
                  fontWeight: FontWeight.w700,
                  color: KColors.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
