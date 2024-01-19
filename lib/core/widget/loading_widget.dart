import '/index.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.valueColor = KColors.white,
    this.color = KColors.primary,
    this.strokeWidth = 4.0,
  });
  final Color color, valueColor;
  final double strokeWidth;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color,
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
