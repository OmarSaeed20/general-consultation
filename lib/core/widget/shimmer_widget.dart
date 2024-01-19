import 'package:shimmer/shimmer.dart';

import '/index.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: KColors.grey,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 700),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8.0,
            showValueIndicator: ShowValueIndicator.onlyForDiscrete,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey[300],
            thumbColor: Colors.blue,
            overlayColor: Colors.blue.withOpacity(0.3),
          ),
          child: child,
        ),
      );
}
