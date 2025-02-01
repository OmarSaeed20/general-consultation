import '/index.dart';

class TxtBtn extends StatelessWidget {
  const TxtBtn(
    this.child, {
    super.key,
    required this.onTap,
    this.onLongpr,
    this.clipper,
    this.color,
    this.padding,
    // this.toolTip,
    this.shape,
  });

  final Widget child;
  final VoidCallback onTap;
  final CustomClipper<Path>? clipper;
  final VoidCallback? onLongpr;
  final Color? color;
  // final String? toolTip;
  final EdgeInsetsGeometry? padding;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? gPadding(),
        child: ClipPath(
          clipper: clipper,
          child: TextButton(
            style: ButtonStyle(
              shape: shape,
              backgroundColor: WidgetStatePropertyAll(color),
            ),
            onPressed: onTap,
            onLongPress: onLongpr,
            child: child,
          ),
        ),
      );
}
