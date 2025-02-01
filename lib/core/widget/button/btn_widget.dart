import '/index.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    this.title,
    required this.onTap,
    this.backgroundColor = KColors.primaryDark,
    this.titleColor = KColors.white,
    this.textStyle,
    this.child,
    this.height = 55,
    // this.width = 335,
    this.radius = 40,
    // this.isLoading = false,
    this.border,
    this.margin,
    this.padding,
    this.rx = RequestState.none,
  });
  final String? title;

  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color titleColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin, padding;
  final double height;
  // final double width;
  final double radius;
  final Widget? child;
  // final bool isLoading;
  final RequestState rx;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        padding: margin ?? gPadding(),
        child: TextButton(
          onPressed: rx.isLoading ? null : onTap,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(gPaddingAll(4)),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: (/* context.width < 350 ? 44 : */ height).h,
            width: (rx.isLoading ? 60 : context.width - 32).w,
            padding: padding ?? gPadding(),
            curve: Curves.easeInOutExpo,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: border,
              // shape: rx.isLoading ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: (rx.isLoading ? 400 : radius).radius,
              color: backgroundColor,
            ),
            child: Material(
              type: MaterialType.button,
              color: backgroundColor,
              borderRadius: (rx.isLoading ? 400 : radius).radius,
              child: rx.isLoading ? const LoadingWidget() : _btnBody(),
            ),
          ),
        ),
      );

  Widget _btnBody() => switch (title) {
        null => child!,
        _ => FittedBox(
            fit: BoxFit.scaleDown,
            child: TextWidget(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  gStyle16(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      };
}
