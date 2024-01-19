import '/index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.softWrap,
    this.style,
    this.padding,
  });
  final String? text;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? gPadding(),
      child: Text(
        text.valide(),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        style: style ?? gStyle14(),
      ),
    );
  }
}
