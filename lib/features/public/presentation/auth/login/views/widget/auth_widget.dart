import '/index.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    required this.supTitle,
    super.key,
    this.padLef = 107,
    this.supStyle,
    this.padding,
    this.titStyle,
  });
  final String title;
  final dynamic supTitle;
  final double padLef;
  final EdgeInsetsGeometry? padding;
  final TextStyle? supStyle, titStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? gPaddingSymmetric(vertical: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: titStyle ?? gStyle16(fontWeight: FontWeight.w700),
          ),
          8.sH,
          Padding(
            padding: gPadding(left: padLef),
            child: (supTitle is String)
                ? TextWidget(
                    supTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: supStyle ?? gStyle14(color: KColors.textGray2),
                  )
                : supTitle,
          ),
        ],
      ),
    );
  }
}
