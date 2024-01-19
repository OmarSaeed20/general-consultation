import '/index.dart';

class AnimationListWidget extends StatelessWidget {
  const AnimationListWidget({
    super.key,
    required this.child,
    required this.index,
    this.vertical,
    this.horizontal,
    this.curve = Curves.ease,
    this.milliseconds = 500,
  });
  final int index;
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final int milliseconds;
  final Curve curve;
  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredList(
        position: index,
        duration: Duration(milliseconds: milliseconds),
        child: SlideAnimation(
          curve: curve,
          horizontalOffset: horizontal,
          verticalOffset: vertical,
          child: FadeInAnimation(child: child),
        ),
      );
}
