import 'package:carousel_slider/carousel_slider.dart';
import '/index.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.images,
    required this.onPageChanged,
    required this.currentIndex,
    this.height,
  });
  final List<dynamic> images;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final int currentIndex;
  final double? height;
  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          height: (height ?? (context.isTablet ? 215 : 156)).h,
          viewportFraction: .8,
          initialPage: 0,
          reverse: false,
          autoPlay: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.easeIn,
          onPageChanged: onPageChanged,
        ),
        items: List.generate(
          images.length,
          (index) => DecoratedBox(
            decoration: BoxDecoration(
              color: KColors.primaryDark,
              borderRadius: 10.radius,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: 10.radius,
                border: Border.all(color: KColors.fillBorder, width: .3),
              ),
              child: ClipRRect(
                borderRadius: 10.radius,
                child: ImageWidget(
                  path: images[index],
                  height: (height ?? (context.isTablet ? 215 : 156)),
                  width: context.width - 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ).toList(),
      );
}

class SliderLoadingWidget extends StatelessWidget {
  const SliderLoadingWidget({super.key, this.height});

  final double? height;
  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          height: (height ?? (context.isTablet ? 215 : 156)).h,
          viewportFraction: .8,
          initialPage: 0,
          reverse: false,
          autoPlay: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.easeIn,
          onPageChanged: (index, reason) {},
        ),
        items: List.generate(
          2,
          (index) => ShimmerWidget(
            child: Container(
              height: (height ?? (context.isTablet ? 215 : 156)),
              width: context.width - 40,
              decoration: BoxDecoration(
                color: KColors.fillColor,
                borderRadius: 10.radius,
              ),
              child: const ImageWidget(path: null),
            ),
          ),
        ).toList(),
      );
}
