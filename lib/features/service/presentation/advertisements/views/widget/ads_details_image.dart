import '/index.dart';

class AdsDetailsImage extends StatelessWidget {
  const AdsDetailsImage({super.key, required this.path});
  final String? path;
  @override
  Widget build(BuildContext context) => Container(
        margin: gPadding(bottom: 4, top: 8),
        decoration: BoxDecoration(
          borderRadius: 4.radius,
          border: Border.all(width: .3, color: KColors.fillBorder),
        ),
        child: ClipRRect(
          borderRadius: 4.radius,
          child: ImageWidget(
            path: path,
            height: 165.h,
            // height: context.height * (1 / 5.8),
            width: double.infinity,
          ),
        ),
      );
}
