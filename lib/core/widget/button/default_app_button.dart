import '/index.dart';

/// Default App Button
class GButton extends StatefulWidget {
  final Function? onTap;
  final String? title;
  final double? width;
  final Color color, textColor;
  final Color? disabledColor,
      focusColor,
      hoverColor,
      splashColor,
      disabledTextColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final RequestState rx;
  final double elevation, radius, height;
  final bool enabled;
  final bool? enableScaleAnimation;

  const GButton({
    this.onTap,
    this.title,
    this.radius = 40,
    this.width,
    this.color = KColors.primaryDark,
    this.textColor = KColors.white,
    this.padding,
    this.rx = RequestState.none,
    this.margin = EdgeInsets.zero,
    this.textStyle,
    this.shapeBorder,
    this.child,
    this.elevation = 4,
    this.height = 55,
    this.enabled = true,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
    this.disabledTextColor,
    super.key,
  });

  @override
  GButtonState createState() => GButtonState();
}

class GButtonState extends State<GButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal ?? 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && widget.enabled) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: (/* context.width < 350 ? 44 : */ widget.height).h,
      width: (/* widget.rx.isLoading ? 80 : */ double.infinity - 32).w,
      margin: widget.margin,
      // padding:
      //     widget.padding ?? gPaddingSymmetric(horizontal: 16, vertical: 16),
      child: widget.rx.isLoading
          ? Loader(size: widget.height.toInt())
          : MaterialButton(
              // minWidth: widget.width ?? double.infinity,
              padding: widget.padding ??
                  gPaddingSymmetric(horizontal: 16, vertical: 14),
              onPressed: widget.enabled /* || !widget.rx.isLoading */
                  ? widget.onTap != null
                      ? widget.onTap as void Function()?
                      : null
                  : null,
              color: widget.color,
              shape: widget.shapeBorder ??
                  RoundedRectangleBorder(borderRadius: widget.radius.radius),
              elevation: widget.elevation,
              animationDuration: const Duration(milliseconds: 300),
              // height: widget.height.h,
              disabledColor: widget.disabledColor,
              focusColor: widget.focusColor,
              hoverColor: widget.hoverColor,
              splashColor: widget.splashColor,
              disabledTextColor: widget.disabledTextColor,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: widget.child ??
                    TextWidget(
                      widget.title,
                      style: widget.textStyle ??
                          gStyle14(
                            color: widget.textColor,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
              ),
            ),
    );
  }
}
